//
//  ScheduleScheduleConfigurator.swift
//  TopEvent
//
//  Created by Vladislav Patrakov on 24/05/2022.
//  Copyright © 2022 OSinit. All rights reserved.
//

import UIKit

class ScheduleModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? ScheduleTableViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: ScheduleTableViewController) {
        let eventCoreData = EventCoreDataStore()
        let eventScheduleFromServer = EventScheduleFromServer()
        
        let authProvider = AuthProvider()
        authProvider.view = viewController
        
        let router = ScheduleRouter()
        router.view = viewController

        let presenter = SchedulePresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = ScheduleInteractor()
        interactor.output = presenter
        interactor.eventCoreData = eventCoreData
        interactor.eventScheduleFromServer = eventScheduleFromServer
        interactor.authProvider = authProvider

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
