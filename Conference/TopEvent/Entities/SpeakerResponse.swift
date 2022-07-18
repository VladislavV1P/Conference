//
//  SpeakerResponse.swift
//  TopEvent
//
//  Created by Владислав Патраков on 13.07.2022.
//

import Foundation

struct SpeakerResponse: Codable {
    var id: String
    var fullName: String
    var thumbnailURL: String
    var specialization: String
    var contactInformation: String
    var technicalSkills: String
}
