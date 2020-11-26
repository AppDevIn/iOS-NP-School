//
//  FriendController.swift
//  Telegramme
//
//  Created by Jeya Vishnu on 24/11/20.
//

import Foundation
import UIKit
import CoreData

//Contact CRUD
class FriendController {
    
    var appDelegate:AppDelegate
    let context:NSManagedObjectContext
    var items:[CDFriend] = []

    init() {
        //Refering to the container
       appDelegate  = (UIApplication.shared.delegate) as! AppDelegate

        //Create a contect for this container
        context = appDelegate.persistentContainer.viewContext
    }
    
    
    func AddFriend(name:String, profileImageName:String)  {
        
        let cdFriend = CDFriend(context: context)
        cdFriend.name = name
        cdFriend.profileImageName = profileImageName
        
        do {
            try context.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
        
        items.append(cdFriend)
    }
    
    func AddMessageToFriend(friend:CDFriend, message:CDMessage) {
       
        friend.addToMessages(message)
        
        
        do {
            
            try context.save()
        } catch  {
            print(error)
        }
        

        
        
        

    }
    
    func retriveMessagesByFriend(friend:CDFriend) -> [CDMessage]{
        
        let request = CDFriend.fetchRequest() as  NSFetchRequest<CDFriend>
        request.predicate =  NSPredicate(format: "name = %@ ", friend.name!)
    
        do {
            let result = try context.fetch(request)
            
            return result[0].messages?.allObjects as! [CDMessage]
        } catch  {
            return []
        }
        
        
        
        
    }
    
    
}
