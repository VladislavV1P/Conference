//
//  ScheduleResponse.swift
//  TopEvent
//
//  Created by Владислав Патраков on 13.07.2022.
//

import Foundation

struct ScheduleResponse: Codable {
    var nameOfConference: String
    var schedule: [EventResponse]
}
