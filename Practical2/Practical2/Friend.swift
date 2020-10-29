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
    var description:String = ""
    public var toString: String { return "Hi I am \(firstName) \(lastName) and I am \(age)" }
    
    
    
    init(firstName:String, lastName:String, age:Int, description:String) {
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
        self.description = description;
        
    }
    
    
    
    
}
