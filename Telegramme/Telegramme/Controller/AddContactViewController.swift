//
//  AddContactViewController.swift
//  Telegramme
//
//  Created by Jeya Vishnu on 10/11/20.
//

import UIKit




class AddContactViewController : UIViewController {
    
    @IBOutlet weak var firstNameFld: UITextField!
    @IBOutlet weak var lastNameFld: UITextField!
    @IBOutlet weak var mobileFld: UITextField!
    @IBOutlet weak var editBtn: UIButton!
    @IBOutlet weak var cancelBtn: UIButton!
    
    var contact:Contact?;
    let contactController:ContactController = ContactController();
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        if let con = contact
        {
            firstNameFld.text =  con.firstName
            lastNameFld.text =  con.lastName
            mobileFld.text =  con.mobileNo
            
            
            editBtn.isHidden = false
            cancelBtn.isHidden = false
        } else {
            editBtn.isHidden = true
            cancelBtn.isHidden = true
        }
        
    }
    
    @IBAction func cancelBtn(_ sender: Any) {
        clear()
    }
    
    
    @IBAction func createBtn(_ sender: Any) {

        
        if(firstNameFld.text! != "" && lastNameFld.text! != "" && mobileFld.text! != ""){
            
            contactController.addContact(newContact: Contact(firstname: firstNameFld.text!, lastname: lastNameFld.text!, mobileno: mobileFld.text!))
            clear()
            print("Contact Created")
            
        }
        
    }
    
    func clear() {
        firstNameFld.text = ""
        lastNameFld.text = ""
        mobileFld.text = ""
    }
    
    @IBAction func cancelClicked(_ sender: Any) {
        backAction()
    }
    
    @IBAction func EditCancel(_ sender: Any) {
        if let con = contact{
//            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            if(firstNameFld.text! != "" && lastNameFld.text! != "" && mobileFld.text! != ""){
//                appDelegate.contactList[index] = Contact(firstname: firstNameFld.text!, lastname: lastNameFld.text!, mobileno: mobileFld.text!)
                let c:Contact =  Contact(firstname: firstNameFld.text!, lastname: lastNameFld.text!, mobileno: mobileFld.text!)
                contactController.updateContact(mobileno: con.mobileNo, newContact:c)
                
                backAction()
            }
            
            
        }
    }
    
    func backAction() {
        self.dismiss(animated: true) {
            print("Back to main controller")
        }

    }
}
