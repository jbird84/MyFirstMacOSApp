//
//  Person.swift
//  MyFirstMacOSApp
//
//  Created by Kinney Kare on 12/15/21.
//

import Foundation

struct Person {
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    static func getSampleData() -> [Person] {
        let p1 = Person(name: "Josh", age: 30),
        p2 = Person(name: "Sarah", age: 31),
        p3 = Person(name: "Tom", age: 22),
        p4 = Person(name: "Cat", age: 26)
        
        return [p1, p2, p3, p4]
    }
    
}
