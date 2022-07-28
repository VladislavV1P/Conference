//
//  EventDetailsTableViewCell.swift
//  TopEvent
//
//  Created by Владислав Патраков on 20.06.2022.
//

import UIKit

class EventDetailsTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var smallerPhotoOfSpeaker: UIImageView!
    @IBOutlet private weak var nameSpeaker: UILabel!
    
    func setNameSpeakerText(name: String) {
        nameSpeaker.text = name
    }
}
