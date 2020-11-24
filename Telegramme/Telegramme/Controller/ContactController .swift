//
//  ContactController .swift
//  Telegramme
//
//  Created by Jeya Vishnu on 24/11/20.
//

import CoreData
import UIKit

//Contact CRUD
class ContactController {
    
    init() {
        
    }
    
    //Add new contact to core data
    func addContact(newContact:Contact) {
        //Refering to the container
        let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
        
        //Create a contect for this container
        let context = appDelegate.persistentContainer.viewContext
        
        //Create an entity and a new contact record
        let contactEntity = NSEntityDescription.entity(forEntityName:"CDContact", in:context)!
        
        //Contact record
        let contact = NSManagedObject(entity:contactEntity, insertInto: context)
        contact.setValue(newContact.firstName , forKeyPath:"firstname")
        contact.setValue(newContact.lastName , forKeyPath:"lastname")
        contact.setValue(newContact.mobileNo , forKeyPath:"mobileno")
        
        do {
            try context.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
        
    }
    
    //Retrieve all contact from core data
    func retrieveAllContact() -> [Contact]? {
        
        //Refering to the container
        let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
        
        //Create a contect for this container
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "CDContact")
        
        //List of the contact
        var contactList:[Contact] = []
        
        do {
            let result = try context.fetch(fetchRequest)
            for data in result as! [NSManagedObject]{
                let con:Contact = Contact(firstname: data.value(forKey: "firstname") as! String, lastname: data.value(forKey: "lastname") as! String, mobileno: data.value(forKey: "mobileno") as! String)
                contactList.append(con)
                
            }
            return contactList
        } catch  {
            print("Failed")
            return nil
        }
        
        
    }
    
    //Update current contact with new contact
    //fetch data  based on mobileno
    func updateContact(mobileno:String, newContact:Contact)  {
        
        //Refering to the container
        let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
        
        //Create a contect for this container
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest.init(entityName: "CDContact")
        fetchRequest.predicate = NSPredicate(format: "mobileno = %@", mobileno)
        
        do {
            
            let result = try context.fetch(fetchRequest)
            
            let objectUpdate = result[0] as! NSManagedObject
            objectUpdate.setValue(newContact.firstName, forKey: "firstname")
            objectUpdate.setValue(newContact.lastName, forKey: "lastname")
            objectUpdate.setValue(newContact.mobileNo, forKey: "mobileno")
            
            do {
                try context.save()
            } catch  {
                print(error)
            }
            
            
        } catch  {
            print(error)
        }
        
        
        
        
    }
    
    //Delete contact
    //fetch data based on mobileno
    func deleteContact(mobileno:String){
        
        //Refering to the container
        let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
        
        //Create a contect for this container
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "CDContact")
        fetchRequest.predicate = NSPredicate(format: "mobileno = %@", mobileno)
        
        do {
            let result = try context.fetch(fetchRequest)
            
            let objecToDelete = result[0] as! NSManagedObject
            context.delete(objecToDelete)
            
            do {
                try context.save()
            } catch  {
                print(error)
            }
            
        } catch  {
            print(error)
        }
        
        
        
    }
    
    
}
