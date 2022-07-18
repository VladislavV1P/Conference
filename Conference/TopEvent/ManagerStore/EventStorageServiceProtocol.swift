//
//  EventCoreDataStoreInput.swift
//  TopEvent
//
//  Created by Владислав Патраков on 29.05.2022.
//

import Foundation

protocol EventStorageServiceProtocol {
    
    func getScheduledEvents() -> [Event]
    func saveEvent(event: [Event])
}
