//
//  EventResponse.swift
//  TopEvent
//
//  Created by Владислав Патраков on 13.07.2022.
//

import Foundation

struct EventResponse: Codable {
    var id: String
    var url: String
    var title: String
    var detail: String
    var location: String
    var speakers: [SpeakerResponse]
    var startDate: String
    var tags: String
    var favoriteStatus: Bool
}
