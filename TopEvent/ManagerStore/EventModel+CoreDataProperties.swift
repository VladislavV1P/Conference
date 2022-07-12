//
//  EventModel+CoreDataProperties.swift
//  TopEvent
//
//  Created by Владислав Патраков on 27.05.2022.
//
//

import Foundation
import CoreData


extension EventModel {

    private enum Constant {
        static let dataUnavailable = "Unknown parameter"
        static let entityName = "EventModel"
    }
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<EventModel> {
        return NSFetchRequest<EventModel>(entityName: Constant.entityName)
    }

    @NSManaged public var id: String
    @NSManaged public var url: String
    @NSManaged public var title: String
    @NSManaged public var detail: String
    @NSManaged public var location: String
    @NSManaged public var startDate: Date
    @NSManaged public var tags: String
    @NSManaged public var favoriteStatus: Bool
    @NSManaged public var speakers: NSSet
}

// MARK: Generated accessors for speakers
extension EventModel {

    @objc(addSpeakersObject:)
    @NSManaged public func addToSpeakers(_ value: SpeakerModel)

    @objc(addSpeakers:)
    @NSManaged public func addToSpeakers(_ values: NSSet)
}
