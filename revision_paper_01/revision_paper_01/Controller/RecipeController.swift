//
//  RecipeController.swift
//  revision_paper_01
//
//  Created by Jeya Vishnu on 10/12/20.
//

import Foundation
import UIKit
import CoreData

class RecipeController {
    var appDelegate:AppDelegate
    let context:NSManagedObjectContext
    var items:[CDRecipe] = []
    
    init() {
        //Refering to the container
        appDelegate  = (UIApplication.shared.delegate) as! AppDelegate
        
        //Create a contect for this container
        context = appDelegate.persistentContainer.viewContext
    }
    
    func addRecipe(name n:String, time t:String) -> CDRecipe {
        let cdRecipe = CDRecipe(context:context)
        let a:Int16? = Int16(t)
        
        cdRecipe.name = n;
        cdRecipe.preparationTime = a!;
        
        do {
            try context.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
        
        items.append(cdRecipe)
        
        return cdRecipe
        
    }
    
    //Retrieve all contact from core data
    func retrieveAllContact() -> [CDRecipe]? {
        
        
        do {
            let result = try context.fetch(CDRecipe.fetchRequest())
            var contactList:[CDRecipe] = []
            
            for data in result as! [CDRecipe]{
                
                contactList.append(data)
            }
            items = contactList
            return items
            
        } catch {
            print(error)
            return nil
            
        }

    }
}
