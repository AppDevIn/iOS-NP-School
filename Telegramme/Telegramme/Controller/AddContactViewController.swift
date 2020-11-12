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
    
    var contactIndex:Int?;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        if let index = contactIndex
        {
            let con:Contact  = appDelegate.contactList[index]
            
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
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        if(firstNameFld.text! != "" && lastNameFld.text! != "" && mobileFld.text! != ""){
            appDelegate.contactList.append(Contact(firstname: firstNameFld.text!, lastname: lastNameFld.text!, mobileno: mobileFld.text!))
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
        if let index = contactIndex{
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            if(firstNameFld.text! != "" && lastNameFld.text! != "" && mobileFld.text! != ""){
                appDelegate.contactList[index] = Contact(firstname: firstNameFld.text!, lastname: lastNameFld.text!, mobileno: mobileFld.text!)
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
