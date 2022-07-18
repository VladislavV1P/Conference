//
//  AboutSpeakerAboutSpeakerInitializer.swift
//  TopEvent
//
//  Created by Vladislav Patrakov on 13/07/2022.
//  Copyright © 2022 OSinit. All rights reserved.
//

import UIKit

class AboutSpeakerModuleInitializer {

    func setupAboutSpeakerModuleConfigurator(view: UIViewController, showSpeakerId: String) {

        let configurator = AboutSpeakerModuleConfigurator()
        configurator.configureModuleForViewInput(
            viewInput: view,
            showSpeakerId: showSpeakerId)
    }
}
