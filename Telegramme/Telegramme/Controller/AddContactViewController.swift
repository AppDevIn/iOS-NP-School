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
    
    var contact:CDContact?;
    let contactController:ContactController = ContactController();
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        if let con = contact
        {
            firstNameFld.text =  con.firstname
            lastNameFld.text =  con.lastname
            mobileFld.text =  con.mobileno
            
            
            editBtn.isHidden = false
            cancelBtn.isHidden = false
        }
        else {
            editBtn.isHidden = true
            cancelBtn.isHidden = true
        }
        
    }
    
    
    
    @IBAction func cancelBtn(_ sender: Any) {
        clear()
    }
    
    
    func clear() {
        firstNameFld.text = ""
        lastNameFld.text = ""
        mobileFld.text = ""
    }

    
    func backAction() {
        self.dismiss(animated: true) {
            print("Back to main controller")
        }

    }
}


//Create the buttong
extension AddContactViewController{
    @IBAction func createBtn(_ sender: Any) {
        
        if(firstNameFld.text! != "" && lastNameFld.text! != "" && mobileFld.text! != ""){
            
            contactController.addContact(firstName: firstNameFld.text!, lastName: lastNameFld.text!, mobileNo: mobileFld.text!)
            clear()
        
            
            print("Contact Created")
            
        }
        
    }
    
    
}


// Edit mode
extension AddContactViewController{
    @IBAction func cancelClicked(_ sender: Any) {
        backAction()
    }
    
    @IBAction func EditCancel(_ sender: Any) {
        

        if(firstNameFld.text! != "" && lastNameFld.text! != "" && mobileFld.text! != ""){
            contactController.updateContact(oldmobileno: (contact?.mobileno)!, firstname: firstNameFld.text!, lastname: lastNameFld.text!, mobileno: mobileFld.text!)
            
            backAction()
        }
        
            
        
    }
}
