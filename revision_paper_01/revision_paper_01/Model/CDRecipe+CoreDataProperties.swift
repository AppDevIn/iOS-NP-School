//
//  CDRecipe+CoreDataProperties.swift
//  revision_paper_01
//
//  Created by Jeya Vishnu on 10/12/20.
//
//

import Foundation
import CoreData


extension CDRecipe {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDRecipe> {
        return NSFetchRequest<CDRecipe>(entityName: "CDRecipe")
    }

    @NSManaged public var name: String?
    @NSManaged public var preparationTime: Int16
    @NSManaged public var ingredient: NSSet?

}

// MARK: Generated accessors for ingredient
extension CDRecipe {

    @objc(addIngredientObject:)
    @NSManaged public func addToIngredient(_ value: CDIngredient)

    @objc(removeIngredientObject:)
    @NSManaged public func removeFromIngredient(_ value: CDIngredient)

    @objc(addIngredient:)
    @NSManaged public func addToIngredient(_ values: NSSet)

    @objc(removeIngredient:)
    @NSManaged public func removeFromIngredient(_ values: NSSet)

}

extension CDRecipe : Identifiable {

}
