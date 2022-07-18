//
//  EventDetailsEventDetailsConfigurator.swift
//  TopEvent
//
//  Created by Vladislav Patrakov on 20/06/2022.
//  Copyright © 2022 OSinit. All rights reserved.
//

import UIKit

class EventDetailsModuleConfigurator {
    
    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController, showEventId: String) {
        
        if let viewController = viewInput as? EventDetailsViewController {
            configure(viewController: viewController, showEventId: showEventId)
        }
    }
    
    private func configure(viewController: EventDetailsViewController, showEventId: String) {
        let eventStorageService = EventStorageService()
        
        let router = EventDetailsRouter(view: viewController)
        
        let presenter = EventDetailsPresenter(showEventId: showEventId)
        presenter.view = viewController
        presenter.router = router
        
        let interactor = EventDetailsInteractor()
        interactor.output = presenter
        interactor.eventStorageService = eventStorageService
        
        presenter.interactor = interactor
        viewController.output = presenter
    }
}
