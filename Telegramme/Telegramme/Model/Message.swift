//
//  Message.swift
//  Telegramme
//
//  Created by Jeya Vishnu on 24/11/20.
//

import Foundation

class Message{
    
    var text:String
    var isSender:Bool
    var date:Date
    
    init(text:String, isSender:Bool, date:Date) {
        self.text = text
        self.isSender = isSender
        self.date = date
    }
    
}
