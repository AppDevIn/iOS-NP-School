//
//  CDFriend+CoreDataProperties.swift
//  Telegramme
//
//  Created by Jeya Vishnu on 26/11/20.
//
//

import Foundation
import CoreData


extension CDFriend {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDFriend> {
        return NSFetchRequest<CDFriend>(entityName: "CDFriend")
    }

    @NSManaged public var name: String?
    @NSManaged public var profileImageName: String?
    @NSManaged public var lastMessage: CDMessage?
    @NSManaged public var messages: NSSet?

}

// MARK: Generated accessors for messages
extension CDFriend {

    @objc(addMessagesObject:)
    @NSManaged public func addToMessages(_ value: CDMessage)

    @objc(removeMessagesObject:)
    @NSManaged public func removeFromMessages(_ value: CDMessage)

    @objc(addMessages:)
    @NSManaged public func addToMessages(_ values: NSSet)

    @objc(removeMessages:)
    @NSManaged public func removeFromMessages(_ values: NSSet)

}

extension CDFriend : Identifiable {

}
