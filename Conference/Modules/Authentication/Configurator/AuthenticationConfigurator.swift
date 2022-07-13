//
//  AuthenticationAuthenticationConfigurator.swift
//  TopEvent
//
//  Created by Vladislav Patrakov on 08/06/2022.
//  Copyright © 2022 OSinit. All rights reserved.
//

import UIKit

class AuthenticationModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? AuthenticationViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: AuthenticationViewController) {

        let router = AuthenticationRouter()

        let presenter = AuthenticationPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = AuthenticationInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
