//
//  CDIngredient+CoreDataProperties.swift
//  revision_paper_01
//
//  Created by Jeya Vishnu on 10/12/20.
//
//

import Foundation
import CoreData


extension CDIngredient {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDIngredient> {
        return NSFetchRequest<CDIngredient>(entityName: "CDIngredient")
    }

    @NSManaged public var name: String?
    @NSManaged public var recipe: NSSet?

}

// MARK: Generated accessors for recipe
extension CDIngredient {

    @objc(addRecipeObject:)
    @NSManaged public func addToRecipe(_ value: CDRecipe)

    @objc(removeRecipeObject:)
    @NSManaged public func removeFromRecipe(_ value: CDRecipe)

    @objc(addRecipe:)
    @NSManaged public func addToRecipe(_ values: NSSet)

    @objc(removeRecipe:)
    @NSManaged public func removeFromRecipe(_ values: NSSet)

}

extension CDIngredient : Identifiable {

}
