//
//  AuthenticationAuthenticationViewController.swift
//  TopEvent
//
//  Created by Vladislav Patrakov on 08/06/2022.
//  Copyright © 2022 OSinit. All rights reserved.
//

import UIKit

class AuthenticationViewController: UIViewController, AuthenticationViewInput {

    var output: AuthenticationViewOutput!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }

    // MARK: AuthenticationViewInput
    func setupInitialState() {
    }
}
