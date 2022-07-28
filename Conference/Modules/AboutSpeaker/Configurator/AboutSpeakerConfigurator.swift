//
//  AboutSpeakerAboutSpeakerConfigurator.swift
//  TopEvent
//
//  Created by Vladislav Patrakov on 27/06/2022.
//  Copyright © 2022 OSinit. All rights reserved.
//

import UIKit

class AboutSpeakerModuleConfigurator {
    
    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController, showSpeakerId: String) {
        
        if let viewController = viewInput as? AboutSpeakerViewController {
            configure(
                viewController: viewController,
                showSpeakerId: showSpeakerId)
        }
    }
    
    private func configure(viewController: AboutSpeakerViewController, showSpeakerId: String) {
        let eventStorageService = EventStorageService()
        
        let router = AboutSpeakerRouter()
        
        let presenter = AboutSpeakerPresenter(
            showSpeakerId: showSpeakerId)
        presenter.view = viewController
        presenter.router = router
        
        let interactor = AboutSpeakerInteractor()
        interactor.output = presenter
        interactor.eventStorageService = eventStorageService
        
        presenter.interactor = interactor
        viewController.output = presenter
    }
    
}
