//
//  UserModel+CoreDataProperties.swift
//  TopEvent
//
//  Created by Владислав Патраков on 27.05.2022.
//
//

import Foundation
import CoreData


extension UserModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserModel> {
        return NSFetchRequest<UserModel>(entityName: "UserModel")
    }

    @NSManaged public var id: String
    @NSManaged public var name: String
    @NSManaged public var email: String
    @NSManaged public var thumbnailURL: String?

}

extension UserModel : Identifiable {

}
