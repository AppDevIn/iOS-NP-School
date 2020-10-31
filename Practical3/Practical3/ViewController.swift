//
//  ViewController.swift
//  Practical3
//
//  Created by Jeya Vishnu on 31/10/20.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    
    
    @IBOutlet weak var myLbl: UILabel!
    @IBOutlet weak var txtField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        txtField.delegate = self 
    }
    
    @IBAction func onClick(_ sender: Any) {
        print("I'm Clicked")
        myLbl.text = "Button has been clicked"
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        txtField.resignFirstResponder()
        myLbl.text = textField.text
        return true
    }


}

