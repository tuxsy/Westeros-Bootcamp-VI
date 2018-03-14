//
//  RepositoryTests.swift
//  WesterosTests
//
//  Created by Alexandre Freire on 13/02/2018.
//  Copyright © 2018 Alexandre Freire. All rights reserved.
//

import XCTest
@testable import Westeros

class RepositoryTests: XCTestCase {
    
    var localHouses: [House]!
    var localSeasons: [Season]!
    
    override func setUp() {
        super.setUp()
        localHouses = Repository.local.houses
        localSeasons = Repository.local.seasons
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    // MARK: - Local Repository common tests
    func testLocalRepositoryCreation() {
        let local = Repository.local
        XCTAssertNotNil(local)
    }
    
    // MARK: - House Collection tests
    func testLocalRepositoryHousesCreation() {
        XCTAssertNotNil(localHouses)
        XCTAssertEqual(localHouses.count, 3)
    }
    
    func testLocalRepositoryReturnsSortedArrayOfHouses() {
        // [2, 5, 6, 10, 18].sorted()
        // [2, 5, 6, 10, 18]
        XCTAssertEqual(localHouses, localHouses.sorted())
    }
    
    func testLocalRepositoryReturnsHouseByCaseInsensitively() {
        let stark = Repository.local.house(named: "sTarK")
        XCTAssertEqual(stark?.name, "Stark")
        
        let keepcoding = Repository.local.house(named: "Keepcoding")
        XCTAssertNil(keepcoding)
    }
    
    func testHouseFiltering() {
        let filtered = Repository.local.houses(filteredBy: { $0.count == 1 })
        XCTAssertEqual(filtered.count, 1)
        
        let otherFilter = Repository.local.houses(filteredBy: { $0.words.contains("invierno")})
        XCTAssertEqual(otherFilter.count, 1)
    }
    
    // MARK: - Season Collection test
    func testLocalRepositorySeasonsCreation() {
        XCTAssertNotNil(localSeasons)
        XCTAssertEqual(localSeasons.count, 7) // Deben existir 7 Temporadas
        
        localSeasons.forEach{
            XCTAssertGreaterThanOrEqual($0.count, 2) // Cada temporada debe tener al menos 2 episodios
        }
    }
    
    
    func testLocalRepositoryReturnsSortedArrayOfSeasons() {
        XCTAssertEqual(localSeasons, localSeasons.sorted())
    }
    
    
    
    
    
}



















