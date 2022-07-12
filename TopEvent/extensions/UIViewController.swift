//
//  UIViewController.swift
//  TopEvent
//
//  Created by Владислав Патраков on 10.06.2022.
//

import UIKit
import Foundation

extension UIViewController {
    
    enum Constant {
        static let error: String = "ⓧ Error in"
        static let errorMessage: String = "\n\n Ocurred in"
        static let errorTitle: String = "Error"
        static let buttonTitle: String = "Ok"
    }
    
  public func displayError(_ error: Error?, from function: StaticString = #function) {
    guard let error = error else { return }
      debugPrint("\(Constant.error) \(function): \(error.localizedDescription)")
      let message = "\(error.localizedDescription)\(Constant.errorMessage) \(function)"
      let alertForm = ScheduleRouter()
      alertForm.alertForm(titleAlert: Constant.errorTitle, messageAlert: message, titleButton: Constant.buttonTitle) {}
  }
}
