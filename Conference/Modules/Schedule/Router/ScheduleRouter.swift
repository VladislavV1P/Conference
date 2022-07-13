//
//  ScheduleRouter.swift
//  TopEvent
//
//  Created by Владислав Патраков on 24.05.2022.
//

import Foundation
import UIKit

class ScheduleRouter: ScheduleRouterInput {
    
    private enum Constants {
        static let nameUIStoryboard: String = "Main"
        static let identifierIDAuthentication: String = "Authentication"
        
        static let signInTitle: String = NSLocalizedString("signInTitle", comment: "")
        static let signInMessage: String = NSLocalizedString("signInMessage", comment: "")
        static let signButtonTitle: String = NSLocalizedString("signButtonTitle", comment: "")
        static let cancelButtonTitle: String = NSLocalizedString("cancelButtonTitle", comment: "")
        
        static let signOutTitle: String = NSLocalizedString("signOutTitle", comment: "")
        static let signOutMessage: String = ""
        static let outButtonTitle: String = NSLocalizedString("outButtonTitle", comment: "")
    }
    
    var view: UIViewController?
    
    func passAuthorization(from view: ScheduleViewInput) {
        let storyboard = UIStoryboard(
            name: Constants.nameUIStoryboard,
            bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: Constants.identifierIDAuthentication) as? AuthenticationViewController {
            guard let sourceView = view as? UIViewController else {return}
            sourceView.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func login(completionHandler: @escaping() -> Void){
        alertForm(
            titleAlert: Constants.signInTitle,
            messageAlert: Constants.signInMessage,
            titleButton: Constants.signButtonTitle) {
                completionHandler()
            }
    }
    
    func singOut(completionHandler: @escaping() -> Void){
        alertForm(
            titleAlert: Constants.signOutTitle,
            messageAlert: Constants.signOutMessage,
            titleButton: Constants.outButtonTitle) {
                completionHandler()
            }
    }
    
    func alertForm(titleAlert: String, messageAlert: String, titleButton: String, completionHandler: @escaping() -> Void) {
        let alert = UIAlertController(
            title: titleAlert,
            message: messageAlert,
            preferredStyle: .alert)
        let outButton = UIAlertAction(
            title: titleButton,
            style: .default) { (_) in
                completionHandler()
            }
        let cancelButton = UIAlertAction(
            title: Constants.cancelButtonTitle,
            style: .default)
        alert.addAction(outButton)
        alert.addAction(cancelButton)
        view?.present(alert, animated: true)
    }
}
