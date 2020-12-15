//
//  CoreDataUser+CoreDataProperties.swift
//  DigitalWallet
//
//  Created by Jeya Vishnu on 14/12/20.
//
//

import Foundation
import CoreData


extension CoreDataUser {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CoreDataUser> {
        return NSFetchRequest<CoreDataUser>(entityName: "CoreDataUser")
    }

    @NSManaged public var amount: Double
    @NSManaged public var password: String?
    @NSManaged public var username: String?
    @NSManaged public var transactions: NSSet?

}

// MARK: Generated accessors for transactions
extension CoreDataUser {

    @objc(addTransactionsObject:)
    @NSManaged public func addToTransactions(_ value: CoreDataTransaction)

    @objc(removeTransactionsObject:)
    @NSManaged public func removeFromTransactions(_ value: CoreDataTransaction)

    @objc(addTransactions:)
    @NSManaged public func addToTransactions(_ values: NSSet)

    @objc(removeTransactions:)
    @NSManaged public func removeFromTransactions(_ values: NSSet)

}

extension CoreDataUser : Identifiable {

}
