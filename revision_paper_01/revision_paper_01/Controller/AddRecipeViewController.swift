//
//  AddRecipeViewController.swift
//  revision_paper_01
//
//  Created by Jeya Vishnu on 10/12/20.
//

import Foundation
import UIKit

class AddRecipeViewController: UIViewController {
    @IBOutlet weak var txt_title: UITextField!
    @IBOutlet weak var txt_time: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func addRecipe(_ sender: Any) {
    //Get One By One with Tag
      if let txtField1 = self.view.viewWithTag(1) as? UITextField {
          print(txtField1.text!)
      }
    }
}
