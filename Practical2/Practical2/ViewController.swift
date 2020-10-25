//
//  ViewController.swift
//  Practical2
//
//  Created by Jeya Vishnu on 25/10/20.
//

import UIKit


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        var friendsList = [Friend]()

        friendsList.append(Friend(firstName: "Jin", lastName: "Mori", age: 1000))
        friendsList.append(Friend(firstName: "Dawei", lastName: "Han", age: 19))
        friendsList.append(Friend(firstName: "Mira", lastName: "Yoo", age: 19))
        friendsList.append(Friend(firstName: "Quan Sheng", lastName: "Lee", age: 20))
        friendsList.append(Friend(firstName: "Auther", lastName: "Pendragon", age: 32))
        
        
        displayAll(friendsList)
        print("Under 20")
        displayFriendsUnder20(friendsList)
        print(findAverageAge(friendsList))
        
        
    }

    func displayAll(_ friendsList:[Friend]){
        for friend in friendsList {
            print(friend.description)
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

}

