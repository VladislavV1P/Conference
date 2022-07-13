//
//  Event.swift
//  TopEvent
//
//  Created by Владислав Патраков on 23.05.2022.
//

import Foundation

struct Event {
    let id: String
    let url: String
    let title: String
    let detail: String
    let location: String
    let speakers: [Speaker]
    let startDate: Date
    let tags: String
    var favoriteStatus = false
}
