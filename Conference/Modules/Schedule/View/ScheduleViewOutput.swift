//
//  ScheduleScheduleViewOutput.swift
//  TopEvent
//
//  Created by Vladislav Patrakov on 24/05/2022.
//  Copyright © 2022 OSinit. All rights reserved.
//

protocol ScheduleViewOutput {

    func viewIsReady(screenIndex: Int)
    func filterScheduleByTag(indexNameItem: Int, screenIndex: Int)
    func passOnEventSelected(event: Event)
    func loginToAccount(signIn: AuthorizationMethod)
    func outAccount()
    func login(completionHandler: @escaping(AuthorizationMethod) -> Void)
    func singOut(completionHandler: @escaping() -> Void)
}
