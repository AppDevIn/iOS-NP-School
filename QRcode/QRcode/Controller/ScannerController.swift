//
//  GenerateQRCode.swift
//  QRcode
//
//  Created by Jeya Vishnu on 1/12/20.
//

import Foundation
import UIKit
import AVFoundation
import QRCoder

class ScannerController: QRCodeScannerViewController {
    
    override func processQRCodeContent(qrCodeContent: String) -> Bool {
        print(qrCodeContent)
        dismiss(animated: true, completion: nil)
        
        redirectToWebView(qrCodeContent)
        
        return true
    }
    
    @IBAction func goBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func redirectToWebView(_ text:String){
        
        if let url = URL(string: text){
            UIApplication.shared.open(url)
        } else { return }
        
    }
    
    
    
}
