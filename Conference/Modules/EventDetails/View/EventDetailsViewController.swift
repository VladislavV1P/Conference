//
//  EventDetailsEventDetailsViewController.swift
//  TopEvent
//
//  Created by Vladislav Patrakov on 20/06/2022.
//  Copyright © 2022 OSinit. All rights reserved.
//

import UIKit

class EventDetailsViewController: UIViewController, EventDetailsViewInput {
    
    private enum Constants {
        static let cellIdentifierSchedule: String = "EventDetailsTableViewCell"
    }
    
    var output: EventDetailsViewOutput!
    private var eventDetails: Event?
    
    @IBOutlet private weak var nameOfConferenceLabel: UILabel!
    @IBOutlet private weak var likeButton: UIButton!
    @IBOutlet private weak var timeOfEvent: UILabel!
    @IBOutlet private weak var locationOfEventLabel: UILabel!
    @IBOutlet private weak var eventTagLabel: UILabel!
    @IBOutlet private weak var aboutEvent: UITextView!
    @IBOutlet private weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        let cellNib = UINib(nibName: Constants.cellIdentifierSchedule, bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: Constants.cellIdentifierSchedule)
        output.viewIsReady()
    }
    
    func setupInitialState(event: Event) {
        nameOfConferenceLabel.text = event.title
        timeOfEvent.text = FormattingUtils.formatTime(date: event.startDate)
        locationOfEventLabel.text = event.location
        eventTagLabel.text = event.tags
        aboutEvent.text = event.detail
        eventDetails = event
    }
}

extension EventDetailsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return eventDetails?.speakers.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let event = eventDetails else {return UITableViewCell()}
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifierSchedule, for: indexPath)
        let nameSpeaker = event.speakers[indexPath.row].fullName
        (cell as? EventDetailsTableViewCell)?.setNameSpeakerText(name: nameSpeaker)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let showSpeakerId = eventDetails?.speakers[indexPath.row].id else {return}
        output.passOnSpeakerSelected(showSpeakerID: showSpeakerId)
    }
}
