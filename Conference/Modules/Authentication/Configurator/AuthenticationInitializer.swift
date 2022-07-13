//
//  AuthenticationAuthenticationInitializer.swift
//  TopEvent
//
//  Created by Vladislav Patrakov on 08/06/2022.
//  Copyright © 2022 OSinit. All rights reserved.
//

import UIKit

class AuthenticationModuleInitializer: NSObject {

    @IBOutlet weak var authenticationViewController: AuthenticationViewController!

    override func awakeFromNib() {

        let configurator = AuthenticationModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: authenticationViewController)
    }

}
