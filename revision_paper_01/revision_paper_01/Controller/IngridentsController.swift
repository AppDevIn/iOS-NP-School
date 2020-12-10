//
//  ingridentsController.swift
//  revision_paper_01
//
//  Created by Jeya Vishnu on 10/12/20.
//

import Foundation
import UIKit
import CoreData

class IngridentsController {
    var appDelegate:AppDelegate
    let context:NSManagedObjectContext
    var items:[CDIngredient] = []
    
    init() {
        //Refering to the container
        appDelegate  = (UIApplication.shared.delegate) as! AppDelegate
        
        //Create a contect for this container
        context = appDelegate.persistentContainer.viewContext
    }
    
    func addIngridents(name:String, recipe rec:CDRecipe)  {
        
        let cdIngridents = CDIngredient(context: context)
        cdIngridents.name = name
        
        rec.addToIngredient(cdIngridents)
        
        do {
            try context.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
        
        items.append(cdIngridents)
    }
    
    
    func retriveMessagesByFriend(recipe:CDRecipe) -> [CDIngredient]{
        
        let request = CDRecipe.fetchRequest() as  NSFetchRequest<CDRecipe>
        request.predicate =  NSPredicate(format: "name = %@ ", recipe.name!)
    
        do {
            let result = try context.fetch(request)
            
            return result[0].ingredient?.allObjects as! [CDIngredient]
        } catch  {
            return []
        }
        
        
        
        
    }
    
    
    
}
