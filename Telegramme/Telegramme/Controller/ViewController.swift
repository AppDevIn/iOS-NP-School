//
//  ViewController.swift
//  Telegramme
//
//  Created by Jeya Vishnu on 10/11/20.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var usrNameFld: UITextField!
    @IBOutlet weak var pwdFld: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let friendC:FriendController = FriendController()
        
        //Refering to the container
       let appDelegate  = (UIApplication.shared.delegate) as! AppDelegate

        //Create a contect for this container
        let context = appDelegate.persistentContainer.viewContext
        
        
        friendC.AddFriend(name: "Hao Man", profileImageName: "google.com")
        friendC.AddFriend(name: "Zac", profileImageName: "google.com")
        
        let message = CDMessage(context: context)
        message.text = "Hello"
        
        friendC.AddMessageToFriend(friend:friendC.items[0] , message: message)
        
        let messages = friendC.retriveMessagesByFriend(friend: friendC.items[0])
        print(messages[0].text)
        
    }

    @IBAction func onClick(_ sender: Any) {
        if true {
            let storyboard = UIStoryboard(name: "Content", bundle: nil)
            let vc = storyboard.instantiateViewController(identifier: "Content") as UIViewController
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true, completion: nil)
        }
    }
    
}

