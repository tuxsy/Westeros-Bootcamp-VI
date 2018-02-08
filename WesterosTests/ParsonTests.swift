//
//  CharacterTests.swift
//  WesterosTests
//
//  Created by Alexandre Freire on 08/02/2018.
//  Copyright © 2018 Alexandre Freire. All rights reserved.
//

import XCTest
@testable import Westeros

class ParsonTests: XCTestCase {
    
    var starkHouse: House!
    var starkSigil: Sigil!
    
    override func setUp() {
        super.setUp()
        starkSigil = Sigil(image: UIImage(), description: "Lobo Huargo")
        starkHouse = House(name: "Stark", sigil: starkSigil, words: "Se acerca el invierno")
        
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testCharacterExistence() {
        
        let ned = Person(name: "Eddard", alias: "Ned", house: starkHouse)
        XCTAssertNotNil(ned)
        
        let arya = Person(name: "Arya", house: starkHouse)
        XCTAssertNotNil(arya)
    }
    
}








