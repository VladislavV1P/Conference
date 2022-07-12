//
//  Speaker.swift
//  TopEvent
//
//  Created by Владислав Патраков on 23.05.2022.
//

import Foundation

struct Speaker: Hashable {
    let id: String
    let fullName: String
    let thumbnailURL: String
    let specialization: String
    let contactInformation: String
    let technicalSkills: String
}
