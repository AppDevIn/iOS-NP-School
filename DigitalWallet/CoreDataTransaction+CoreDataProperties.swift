//
//  CoreDataTransaction+CoreDataProperties.swift
//  DigitalWallet
//
//  Created by Jeya Vishnu on 14/12/20.
//
//

import Foundation
import CoreData


extension CoreDataTransaction {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CoreDataTransaction> {
        return NSFetchRequest<CoreDataTransaction>(entityName: "CoreDataTransaction")
    }

    @NSManaged public var amount: Double
    @NSManaged public var date: Date?
    @NSManaged public var payee: String?
    @NSManaged public var user: CoreDataUser?

}

extension CoreDataTransaction : Identifiable {

}
