//
//  AboutSpeakerAboutSpeakerViewController.swift
//  TopEvent
//
//  Created by Vladislav Patrakov on 27/06/2022.
//  Copyright © 2022 OSinit. All rights reserved.
//

import UIKit

class AboutSpeakerViewController: UIViewController, AboutSpeakerViewInput {
    
    var output: AboutSpeakerViewOutput!
    
    @IBOutlet private weak var nameSpeakerLabel: UILabel!
    @IBOutlet private weak var specializationLabel: UILabel!
    @IBOutlet private weak var hardSkills: UITextView!
    @IBOutlet private weak var contactsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }
    
    func setupInitialState(speaker: Speaker) {
        nameSpeakerLabel.text = speaker.fullName
        specializationLabel.text = speaker.specialization
        hardSkills.text = speaker.technicalSkills
        contactsLabel.text = speaker.contactInformation
    }
}
