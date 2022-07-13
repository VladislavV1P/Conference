//
//  AboutSpeakerAboutSpeakerConfigurator.swift
//  TopEvent
//
//  Created by Vladislav Patrakov on 13/07/2022.
//  Copyright © 2022 OSinit. All rights reserved.
//

import UIKit

class AboutSpeakerModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? AboutSpeakerViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: AboutSpeakerViewController) {

        let router = AboutSpeakerRouter()

        let presenter = AboutSpeakerPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = AboutSpeakerInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
