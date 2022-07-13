//
//  ScheduleTableViewController.swift
//  TopEvent
//
//  Created by Владислав Патраков on 23.05.2022.
//

import UIKit
import FirebaseCore
import FirebaseAuth
import GoogleSignIn

class ScheduleTableViewController: UITableViewController, ScheduleViewInput {
    
    private enum Constants {
        static let cellIdentifierSchedule: String = "ScheduleTableViewCell"
        static let nameOfConference: String = "Conference OSinit"
        
        static let marginFromBorderSegmentControl: CGFloat = 10
        static let segmentedControlHeight: CGFloat = 30
        
        static let marginTopProfileIconButton: CGFloat = -25
        static let marginRightProfileIconButton: CGFloat = -20
        static let profileIconButtonHeight: CGFloat = 50
        static let profileIconButtonWidth: CGFloat = 50
        static let profileIconButtonCornerRadius: CGFloat = 25
        static let profileIconButtonBorderWidth: CGFloat = 3
        
        static let timeInterval: Double = 0.5
    }
    
    var output: (ScheduleViewOutput & ScheduleTableViewCellOutput)?
    var schedule: [Event] = []
    var nameOfConference = Constants.nameOfConference
    var nameTagItemSegmentControl = [String]()
    var segmentedControl = UISegmentedControl()
    var profileIconButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let cellNib = UINib(nibName: Constants.cellIdentifierSchedule, bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: Constants.cellIdentifierSchedule)
        output?.viewIsReady(screenIndex: tabBarItem.tag)
        
        let headerView = HeaderView(nameOfConference: nameOfConference)
        
        initSearchController(nameItemsSegmentControl: nameTagItemSegmentControl,
                             view: headerView)
        initProfileIconButton(view: headerView)
        
        tableView.tableHeaderView = headerView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        reloadTableView()
    }
    
    func reloadInterface(with events: [Event], nameOfConference: String, nameTagItemSegmentControl: [String]){
        self.nameOfConference = nameOfConference
        self.nameTagItemSegmentControl = nameTagItemSegmentControl
        schedule = events
        tableView.reloadData()
    }
    
    func reloadTableView() {
        output?.viewIsReady(screenIndex: tabBarItem.tag)
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return schedule.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifierSchedule, for: indexPath) as? ScheduleTableViewCell
        cell?.inject(presenter: output!)
        cell?.setupCell(event: schedule[indexPath.row], index: indexPath.row)
        return cell ?? UITableViewCell()
    }
}

extension ScheduleTableViewController {
    
    private func initSearchController(nameItemsSegmentControl: [String], view: UIView) {
        segmentedControl = UISegmentedControl(items: nameItemsSegmentControl)
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(segmentedControl)
        
        segmentedControl.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - Constants.marginFromBorderSegmentControl).isActive = true
        segmentedControl.heightAnchor.constraint(equalToConstant: Constants.segmentedControlHeight).isActive = true
        segmentedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        segmentedControl.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        segmentedControl.backgroundColor = UIColor.systemBackground
        segmentedControl.addTarget(self, action: #selector(self.valueChanged(sender:)), for: .valueChanged)
    }
    
    @objc private func valueChanged(sender: UISegmentedControl) {
        Timer.scheduledTimer(withTimeInterval: Constants.timeInterval, repeats: false) { [weak self] (timer) in
            guard let self = self else {return}
            self.output?.filterScheduleByTag(indexNameItem: sender.selectedSegmentIndex, screenIndex: self.tabBarItem.tag)
        }
    }
    
    private func initProfileIconButton(view: UIView) {
        profileIconButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(profileIconButton)
        
        profileIconButton.widthAnchor.constraint(equalToConstant: Constants.profileIconButtonWidth).isActive = true
        profileIconButton.heightAnchor.constraint(equalToConstant: Constants.profileIconButtonHeight).isActive = true
        profileIconButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: Constants.marginRightProfileIconButton).isActive = true
        profileIconButton.topAnchor.constraint(equalTo: view.topAnchor, constant: Constants.marginTopProfileIconButton).isActive = true
        
        profileIconButton.layer.cornerRadius = Constants.profileIconButtonCornerRadius
        profileIconButton.layer.borderWidth = Constants.profileIconButtonBorderWidth
        profileIconButton.layer.borderColor = UIColor.systemCyan.cgColor
        profileIconButton.addTarget(self, action: #selector(makeAuthorization), for: .touchUpInside)
        profileIconButton.setImage(UIImage(named: "person1"), for: .normal)
    }
    
    @objc func makeAuthorization(sender: UIButton!) {
        if (Auth.auth().currentUser?.displayName) != nil  {
            output?.singOut() {[weak self] in
                guard let self = self else {return}
                self.output?.outAccount()
            }
        } else {
            output?.login() {[weak self] in
                guard let self = self else {return}
                self.output?.signGoogle()
            }
        }
    }
}
