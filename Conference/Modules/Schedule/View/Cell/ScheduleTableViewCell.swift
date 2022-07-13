//
//  ScheduleTableViewCell.swift
//  TopEvent
//
//  Created by Владислав Патраков on 23.05.2022.
//

import UIKit

class ScheduleTableViewCell: UITableViewCell {
    
    private var presenter: ScheduleTableViewCellOutput!
    
    @IBOutlet private weak var nameOfConferenceLabel: UILabel!
    @IBOutlet private weak var locationOfEventLabel: UILabel!
    @IBOutlet private weak var speakerFullNameLabel: UILabel!
    @IBOutlet private weak var eventTagLabel: UILabel!
    @IBOutlet private weak var timeOfEvent: UILabel!
    @IBOutlet private weak var likeButton: UIButton!
    
    func setupCell(event: Event, index: Int) {
        nameOfConferenceLabel.text = event.title
        locationOfEventLabel.text = event.location
        speakerFullNameLabel.text = event.speakers.first?.fullName
        eventTagLabel.text = event.tags
        timeOfEvent.text = FormattingUtils.formatTime(date: event.startDate)
        likeButton.tintColor = event.favoriteStatus ? .systemBlue : .systemGray2
        likeButton.tag = index
    }
    
    func inject(presenter: ScheduleTableViewCellOutput) {
            self.presenter = presenter
        }
    
    @IBAction private func addToFavorites(_ sender: UIButton) {
        presenter.addToFavorites(index: sender.tag)
    }
    
}
