//
//  RecipeTableViewController.swift
//  revision_paper_01
//
//  Created by Jeya Vishnu on 10/12/20.
//

import Foundation
import UIKit

class RecipeTableViewController : UITableViewController {
    
    let recipe:RecipeController = RecipeController()
    let ingridents:IngridentsController = IngridentsController()
    var recipeList:[CDRecipe] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchPeople()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        fetchPeople()
    }
    
    func fetchPeople(){
        if let recipe = recipe.retrieveAllContact() {
              recipeList = recipe
              DispatchQueue.main.async {
                  self.tableView.reloadData()
              }
              
          }
          
      }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipeList.count
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let recipe = recipeList[indexPath.row]
        let time = String(recipe.preparationTime)
        cell.textLabel!.text = "\(recipe.name!) (\(time))"
        
        let ingridentsList:[CDIngredient] = ingridents.retriveMessagesByFriend(recipe: recipeList[indexPath.row])
        
        var allIngridents:String = ""
        for ingr in ingridentsList {
            allIngridents += "[\(ingr.name!)] "
        }
        cell.detailTextLabel!.text = "Ingridents: \(allIngridents)"
        
        return cell
    }
    
    
    
}
