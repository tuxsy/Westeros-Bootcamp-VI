//
//  Character.swift
//  Westeros
//
//  Created by Alexandre Freire on 08/02/2018.
//  Copyright © 2018 Alexandre Freire. All rights reserved.
//

import Foundation

final class Person {
    let name: String
    let house: House
    private let _alias: String?
    
    var alias: String {
        return _alias ?? ""
    }
    
    init(name: String, alias: String?, house: House) {
        self.name = name
        _alias = alias
        self.house = house
    }
    
    convenience init(name: String, house: House) {
        self.init(name: name, alias: nil, house: house)
    }
}
