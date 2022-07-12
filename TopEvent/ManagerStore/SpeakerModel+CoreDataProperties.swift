//
//  SpeakerModel+CoreDataProperties.swift
//  TopEvent
//
//  Created by Владислав Патраков on 27.05.2022.
//
//

import Foundation
import CoreData


extension SpeakerModel {
    
    private enum Constant {
        static let entityName = "SpeakerModel"
    }
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<SpeakerModel> {
        return NSFetchRequest<SpeakerModel>(entityName: Constant.entityName)
    }

    @NSManaged public var id: String
    @NSManaged public var fullName: String
    @NSManaged public var thumbnailURL: String
    @NSManaged public var specialization: String
    @NSManaged public var contactInformation: String
    @NSManaged public var technicalSkills: String
}

extension SpeakerModel : Identifiable {

}
