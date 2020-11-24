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
    
    func AddFriend(friend:Friend)  {
        //Refering to the container
        let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
        
        //Create a contect for this container
        let context = appDelegate.persistentContainer.viewContext
        
        //Create an entity and a new friend record
        let friendEntity = NSEntityDescription.entity(forEntityName:"CDFriend", in:context)!
        
        //friend record
        let friendObj = NSManagedObject(entity:friendEntity, insertInto: context)
        friendObj.setValue(friend.name , forKeyPath:"name")
        friendObj.setValue(friend.profileImageName , forKeyPath:"profileImageName")
        
        
        do {
            try context.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    func AddMessageToFriend(friend:Friend, message:Message) {
        //Refering to the container
        let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
        
        //Create a contect for this container
        let context = appDelegate.persistentContainer.viewContext
        
        //Create an entity and a new friend record
        let messageEntity = NSEntityDescription.entity(forEntityName:"CDMessage", in:context)!
        
        //friend record
        let messageObj = NSManagedObject(entity:messageEntity, insertInto: context)
        messageObj.setValue(message.isSender , forKeyPath:"isSender")
        messageObj.setValue(message.text , forKeyPath:"text")
        messageObj.setValue(message.date , forKeyPath:"date")
        messageObj.setValue(friend , forKeyPath:"friend")
        
        
        
        
        do {
            try context.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    func retriveMessagesByFriend(friend:Friend) -> [Message]{
        return []
    }
    
    
}
