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
    func addContact(firstName:String, lastName:String, mobileNo:String) {
        
        
        //Create the object
        let contact = CDContact(context: context)
        contact.firstname = firstName
        contact.lastname = lastName
        contact.mobileno = mobileNo
        
        
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
            var list:[CDContact] = []
            
            for data in result as! [CDContact]{
                
                list.append(data)
            }
            items = list
            return items
            
        } catch {
            print(error)
            return nil
            
        }

    }
    
    //Update current contact with new contact
    //fetch data  based on mobileno
    func updateContact(oldmobileno:String, firstname:String, lastname:String, mobileno:String)  {
        
        let request = CDContact.fetchRequest() as NSFetchRequest<CDContact>
        request.predicate = NSPredicate(format: "mobileno = %@", oldmobileno)
        do {
            let result = try context.fetch(request)
            let contact =  result[0]
            
            contact.firstname = firstname
            contact.lastname = lastname
            contact.mobileno = mobileno
            
            try self.context.save()
            
            if let contacts = self.retrieveAllContact() {
                items = contacts
            }
            
        } catch  {
            print(error)
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
