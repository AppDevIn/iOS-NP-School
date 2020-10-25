//
//  Friend.swift
//  Practical2
//
//  Created by Jeya Vishnu on 25/10/20.
//

import Foundation


class Friend{
    var firstName:String = ""
    var lastName:String = ""
    var age:Int = 0
    
    public var description: String { return "Hi I am \(firstName) \(lastName) and I am \(age)" }
    
    init(firstName:String, lastName:String, age:Int) {
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
        
    }
    
    
    
    
}
