//
//  AuthenticationUserInput.swift
//  TopEvent
//
//  Created by Владислав Патраков on 10.06.2022.
//

import Foundation
import UIKit

protocol UserAuthenticationRequirements {
    func signGoogle()
    func signAppleID()
    func outAccount()
    var view: UIViewController? { get set }
}
