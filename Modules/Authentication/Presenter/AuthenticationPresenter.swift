//
//  AuthenticationAuthenticationPresenter.swift
//  TopEvent
//
//  Created by Vladislav Patrakov on 08/06/2022.
//  Copyright © 2022 OSinit. All rights reserved.
//

class AuthenticationPresenter: AuthenticationModuleInput, AuthenticationViewOutput, AuthenticationInteractorOutput {

    weak var view: AuthenticationViewInput!
    var interactor: AuthenticationInteractorInput!
    var router: AuthenticationRouterInput!

    func viewIsReady() {

    }
}
