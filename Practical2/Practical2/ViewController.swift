//
//  ViewController.swift
//  Practical2
//
//  Created by Jeya Vishnu on 25/10/20.
//

import UIKit


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var tableView: UITableView!
    var friendsList = [Friend]()
    let cellReuseIdentifier = "cell"
    var isAll:Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        friendsList.append(Friend(firstName: "Jin", lastName: "Mori", age: 1000, description: "GOH"))
        friendsList.append(Friend(firstName: "Dawei", lastName: "Han", age: 19, description: "GOH"))
        friendsList.append(Friend(firstName: "Mira", lastName: "Yoo", age: 19, description: "GOH"))
        friendsList.append(Friend(firstName: "Quan Sheng", lastName: "Lee", age: 20, description: "TRY TO BE IN GOH"))
        friendsList.append(Friend(firstName: "Auther", lastName: "Pendragon", age: 32, description: "King of England"))
        
        
        displayAll(friendsList)
        print("Under 20")
        displayFriendsUnder20(friendsList)
        print(findAverageAge(friendsList))
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
        
    }
    @IBAction func under20Pressed(_ sender: Any) {
        
        isAll = false
        tableView.reloadData()
    }
    
    @IBAction func displayAll(_ sender: Any) {
        isAll = true
        tableView.reloadData()
        
    }
    
    func displayAll(_ friendsList:[Friend]){
        for friend in friendsList {
            print(friend.toString)
        }
    }
    
    
    func displayFriendsUnder20(_ friendsList:[Friend]) {
        displayAll(friendsList.filter { $0.age < 20}) 
    }
    
    
    func findAverageAge(_ friendsList:[Friend])->Double {
        var total = 0
        for friend in friendsList {
            total += friend.age
        }
        return Double(total) / Double(friendsList.count)
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if isAll{
            return self.friendsList.count
        }
        else{
            return self.friendsList.filter { $0.age < 20}.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:UITableViewCell = (self.tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as UITableViewCell?)!
        
        if isAll{
            cell.textLabel?.text = self.friendsList[indexPath.row].toString
        }
        else{
            cell.textLabel?.text = self.friendsList.filter { $0.age < 20}[indexPath.row].toString
        }
        
        
        
        return cell
    }
    
    
}

