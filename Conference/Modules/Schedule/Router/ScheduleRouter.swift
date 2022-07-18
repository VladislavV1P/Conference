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
        static let identifierIDEventDetails: String = "EventDetails"
        
        static let signInTitle: String = NSLocalizedString("signInTitle", comment: "")
        static let signInMessage: String = NSLocalizedString("signInMessage", comment: "")
        static let signButtonTitle: String = NSLocalizedString("signButtonTitle", comment: "")
        static let cancelButtonTitle: String = NSLocalizedString("cancelButtonTitle", comment: "")
        
        static let signOutTitle: String = NSLocalizedString("signOutTitle", comment: "")
        static let signOutMessage: String = ""
        static let outButtonTitle: String = NSLocalizedString("outButtonTitle", comment: "")
        static let signInWithApple: String = NSLocalizedString("signInWithAppleTitle", comment: "")
    }
    
    var view: UIViewController?
    
    func passOnEventSelected(event: Event) {
        guard let sourceView = self.view else {return}
        let storyboard = UIStoryboard(
            name: Constants.nameUIStoryboard,
            bundle: nil)
        if let vc = storyboard
            .instantiateViewController(withIdentifier: Constants.identifierIDEventDetails) as? EventDetailsViewController {
            
            sourceView.navigationController?
                .pushViewController(vc,
                animated: true)
            let eventDetailsModuleInitializer = EventDetailsModuleInitializer()
            eventDetailsModuleInitializer.setupEventDetailsModuleConfigurator(view: vc, showEventId: event.id)
        }
    }
    
    func login(completionHandler: @escaping(AuthorizationMethod) -> Void){
        alertForm(
            isAppleAuthorizationButton: true,
            titleAlert: Constants.signInTitle,
            messageAlert: Constants.signInMessage,
            titleButton: Constants.signButtonTitle) { authorizationMethod in
                completionHandler(authorizationMethod)
            }
    }
    
    func singOut(completionHandler: @escaping() -> Void){
        alertForm(
            titleAlert: Constants.signOutTitle,
            messageAlert: Constants.signOutMessage,
            titleButton: Constants.outButtonTitle) { (_) in
                completionHandler()
            }
    }
    
    func alertForm(isAppleAuthorizationButton: Bool = false,
                   titleAlert: String,
                   messageAlert: String,
                   titleButton: String,
                   completionHandler: @escaping(AuthorizationMethod) -> Void) {
        let alert = UIAlertController(
            title: titleAlert,
            message: messageAlert,
            preferredStyle: .alert)
        let authorizationGoogle = UIAlertAction(
            title: titleButton,
            style: .default) { (_) in
                completionHandler(.google)
            }
        let cancel = UIAlertAction(
            title: Constants.cancelButtonTitle,
            style: .default)
        alert.addAction(authorizationGoogle)
        if isAppleAuthorizationButton {
            addAuthorizationAppleIDButton(alert: alert) {
                completionHandler(.apple)
            }
        }
        alert.addAction(cancel)
        view?.present(alert, animated: true)
    }
    
    func addAuthorizationAppleIDButton(alert: UIAlertController, completionHandler: @escaping() -> Void){
        let authorizationAppleID = UIAlertAction(
            title: Constants.signInWithApple, style: .default) { (_) in
                completionHandler()
            }
        alert.addAction(authorizationAppleID)
    }
}

