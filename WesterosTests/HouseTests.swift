//
//  HouseTests.swift
//  WesterosTests
//
//  Created by Alexandre Freire on 08/02/2018.
//  Copyright © 2018 Alexandre Freire. All rights reserved.
//

import XCTest
@testable import Westeros

class HouseTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testHouseExistence() {
        let starkSigil = Sigil(image: UIImage(), description: "Lobo Huargo")
        let stark = House(name: "Stark", sigil: starkSigil, words: "Se acerca el invierno")
        XCTAssertNotNil(stark)
    }
    
    func testSigilExistence() {
        let starkSigil = Sigil(image: UIImage(), description: "Lobo Huargo")
        XCTAssertNotNil(starkSigil)
        
        let lannisterSigil = Sigil(image: UIImage(), description: "Leon Rampante")
        XCTAssertNotNil(lannisterSigil)
    }
    
}















