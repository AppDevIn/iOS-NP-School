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
    
    var ingridents:IngridentsController = IngridentsController()
    var recipe:RecipeController = RecipeController()
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func addRecipe(_ sender: Any) {
        
        var count:Int = 0
        if let time = txt_time.text, let title = txt_title.text{
            if !time.isEmpty && !title.isEmpty {
                let r:CDRecipe =  recipe.addRecipe(name: title, time: time)
                for index in 1...5 {
                    //Get One By One with Tag
                    if let txtField1 = self.view.viewWithTag(index) as? UITextField {
                        
                        if let text = txtField1.text{
                            if !text.isEmpty {
                                print(txtField1.text!)
                                ingridents.addIngridents(name: txtField1.text!, recipe: r)
                                count += 1
                            }
                        }
                        
                    }
                }
            } else {
                alert("Please populate the title and preration time")
            }
        }
        
        if(count < 1){
            alert("Need at least one ingredient")
            return
        }
        
        
        
    }
    
    func alert(_ message:String){
        print("Alert: \(message)")
        let alert = UIAlertController(title: "Empty field", message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Noted", style: UIAlertAction.Style.default){_ in
            self.dismiss(animated: true, completion: nil)
        })
        
        self.present(alert, animated: true, completion: nil)
        
    }
    
    
}
