//
//  EventScheduleFromServerInput.swift
//  TopEvent
//
//  Created by Владислав Патраков on 01.06.2022.
//

import Foundation

protocol EventScheduleFromServerInput {
    func getData(completionHandler: @escaping([Event], String) -> Void)
    func setData()
}
