//
//  AboutSpeakerAboutSpeakerInitializer.swift
//  TopEvent
//
//  Created by Vladislav Patrakov on 13/07/2022.
//  Copyright © 2022 OSinit. All rights reserved.
//

import UIKit

class AboutSpeakerModuleInitializer: NSObject {

    //Connect with object on storyboard
    @IBOutlet weak var aboutspeakerViewController: AboutSpeakerViewController!

    override func awakeFromNib() {

        let configurator = AboutSpeakerModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: aboutspeakerViewController)
    }

}
