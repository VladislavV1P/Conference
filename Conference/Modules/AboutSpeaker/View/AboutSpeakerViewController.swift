//
//  AboutSpeakerAboutSpeakerViewController.swift
//  TopEvent
//
//  Created by Vladislav Patrakov on 13/07/2022.
//  Copyright © 2022 OSinit. All rights reserved.
//

import UIKit

class AboutSpeakerViewController: UIViewController, AboutSpeakerViewInput {

    var output: AboutSpeakerViewOutput!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }


    // MARK: AboutSpeakerViewInput
    func setupInitialState() {
    }
}
