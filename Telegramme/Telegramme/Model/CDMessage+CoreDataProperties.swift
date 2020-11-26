//
//  CDMessage+CoreDataProperties.swift
//  Telegramme
//
//  Created by Jeya Vishnu on 26/11/20.
//
//

import Foundation
import CoreData


extension CDMessage {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDMessage> {
        return NSFetchRequest<CDMessage>(entityName: "CDMessage")
    }

    @NSManaged public var date: Date?
    @NSManaged public var isSender: Bool
    @NSManaged public var text: String?
    @NSManaged public var friend: CDFriend?

}

extension CDMessage : Identifiable {

}
