//
//  ScheduleScheduleRouterInput.swift
//  TopEvent
//
//  Created by Vladislav Patrakov on 24/05/2022.
//  Copyright © 2022 OSinit. All rights reserved.
//

import Foundation
import UIKit

protocol ScheduleRouterInput {
    func passAuthorization(from view: ScheduleViewInput)
    var view: UIViewController? {get set}
    func login(completionHandler: @escaping() -> Void)
    func singOut(completionHandler: @escaping() -> Void)
}
