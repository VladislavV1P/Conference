//
//  ScheduleScheduleViewInput.swift
//  TopEvent
//
//  Created by Vladislav Patrakov on 24/05/2022.
//  Copyright © 2022 OSinit. All rights reserved.
//

protocol ScheduleViewInput: AnyObject {

    func reloadInterface(with events: [Event], nameOfConference: String, nameTagItemSegmentControl: [String])
    func setupInitialState(with events: [Event], nameOfConference: String, nameTagItemSegmentControl: [String])
    func reloadTableView()
}
