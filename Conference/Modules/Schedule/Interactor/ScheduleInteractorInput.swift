//
//  ScheduleScheduleInteractorInput.swift
//  TopEvent
//
//  Created by Vladislav Patrakov on 24/05/2022.
//  Copyright © 2022 OSinit. All rights reserved.
//

import Foundation

protocol ScheduleInteractorInput {

    func retrieveEventsSchedule(screenIndex: Int)
    func addToFavorites(index: Int)
    func providingDataForDisplay(indexNameItem: Int, screenIndex: Int)
    func signGoogle()
    func outAccount()
}
