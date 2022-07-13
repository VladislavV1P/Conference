//
//  EventCoreDataStoreInput.swift
//  TopEvent
//
//  Created by Владислав Патраков on 29.05.2022.
//

import Foundation

protocol EventCoreDataStoreInput {
    
    func loadFavoriteEvent() -> [Event]
    func saveEvent(event: [Event])
}
