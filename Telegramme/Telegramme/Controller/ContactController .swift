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
    
    
    var appDelegate:AppDelegate
    let context:NSManagedObjectContext
    var items:[CDContact] = []

    init() {
        //Refering to the container
       appDelegate  = (UIApplication.shared.delegate) as! AppDelegate

        //Create a contect for this container
        context = appDelegate.persistentContainer.viewContext
    }
    
    //Add new contact to core data
    func addContact(newContact:Contact) {
        
        
        //Create the object
        let contact = CDContact(context: context)
        contact.firstname = newContact.firstName
        contact.lastname = newContact.lastName
        contact.mobileno = newContact.mobileNo
        
        
        //Save the data
        do {
            try context.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
        
    }
    
    //Retrieve all contact from core data
    func retrieveAllContact() -> [CDContact]? {
        
        
        do {
            let result = try context.fetch(CDContact.fetchRequest())
            var contactList:[CDContact] = []
            
            for data in result as! [CDContact]{
                
                contactList.append(data)
            }
            items = contactList
            return items
            
        } catch {
            print(error)
            return nil
            
        }

    }
    
    //Update current contact with new contact
    //fetch data  based on mobileno
    func updateContact(mobileno:String, newContact:Contact)  {
        
        self.retrieveAllContact()
        if let contact = items.first(where: { $0.mobileno == mobileno }) {
            contact.firstname = newContact.firstName
            contact.lastname = newContact.lastName
            contact.mobileno = newContact.mobileNo
            
            do {
                try self.context.save()
            } catch  {
                print(error)
            }

            
            if let contacts = self.retrieveAllContact() {
                items = contacts
            }
        }
        
   
        
        
        
    }
    
    //Delete contact
    //fetch data based on mobileno
    func deleteContact(mobileno:String){
        
        if let contact = items.first(where: { $0.mobileno == mobileno }) {
            self.context.delete(contact)
        }
        
        do {
            try context.save()
        } catch  {
            print(error)
        }

        
        if let contacts = self.retrieveAllContact() {
            items = contacts
        }
        
        
        
    }
    
    
}
