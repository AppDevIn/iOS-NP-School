//
//  CDContact+CoreDataProperties.swift
//  Telegramme
//
//  Created by Jeya Vishnu on 26/11/20.
//
//

import Foundation
import CoreData


extension CDContact {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDContact> {
        return NSFetchRequest<CDContact>(entityName: "CDContact")
    }

    @NSManaged public var firstname: String?
    @NSManaged public var lastname: String?
    @NSManaged public var mobileno: String?

}

extension CDContact : Identifiable {

}
