//
//  userController.swift
//  DigitalWallet
//
//  Created by Jeya Vishnu on 14/12/20.
//

import Foundation
import UIKit
import CoreData
class name{
    var appDelegate:AppDelegate
    let context:NSManagedObjectContext
    var items:[CoreDataUser] = []
    
    init() {
      //Refering to the container
      appDelegate  = (UIApplication.shared.delegate) as! AppDelegate

        //Create a contect for this container
      context = appDelegate.persistentContainer.viewContext
    }
    
    
    func Adduser(name:String, password:String, amount:Double)  {
            
            //Create the object
            let user = CoreDataUser(context: context)
            user.password = password
            user.username = name
            user.amount = amount
               
                    //Save the data
            do {
                try context.save()
            } catch let error as NSError {
                print("Could not save. \(error), \(error.userInfo)")
            }
            
            items.append(user)
        }
    
    
    //Retrieve all contact from core data
    func retrieveUser(password:String) -> CoreDataUser? {
            
            
            do {
                let result = try context.fetch(CoreDataUser.fetchRequest())
                
                
                for data in result as! [CoreDataUser]{
                    
                    if data.password == password {
                        return data
                    }
                }
                
                return nil
                
            } catch {
                print(error)
                return nil
                
            }

        }
    
}
