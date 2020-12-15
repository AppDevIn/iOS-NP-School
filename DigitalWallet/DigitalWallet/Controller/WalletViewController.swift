//
//  ViewController.swift
//  DigitalWallet
//
//  Created by Jeya Vishnu on 14/12/20.
//

import UIKit

class WalletViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func submitPassword(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil) // File name of the story board
        let vc = storyboard.instantiateViewController(identifier: "wallet") as UIViewController // name must set as the identifer in stroyboard
        vc.modalPresentationStyle = .fullScreen //
        present(vc, animated: true, completion: nil)
    }
    
}

