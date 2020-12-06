//
//  ViewController.swift
//  QRcode
//
//  Created by Jeya Vishnu on 1/12/20.
//

import UIKit
import QRCoder

class ViewController: UIViewController {

    
    @IBOutlet weak var txt_input: UITextField!
    @IBOutlet weak var image: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btn_submit(_ sender: Any) {
        if let text = txt_input.text {
            image.image = generateCode(text)
        }
        
    }
    
    func generateCode(_ text:String) -> QRImage {
        let generator = QRCodeGenerator()
        
        generator.correctionLevel = .H
        
        return generator.createImage(value: text, size: CGSize(width: 200,height: 200), encoding: .utf8)!
        
    }
    
}

