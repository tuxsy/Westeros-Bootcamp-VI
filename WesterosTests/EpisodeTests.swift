//
//  EpisodeTests.swift
//  WesterosTests
//
//  Created by Bruno Anglés Robles on 12/3/18.
//  Copyright © 2018 Alexandre Freire. All rights reserved.
//

import XCTest
@testable import Westeros

let EPISODE_1_NAME = "1x01 Winter is Coming"
let EPISODE_2_NAME = "1x02 The Kingsroad"
let EPISODE_1_RELEASE_DATE = Date(dateString: "2011-04-17")
let EPISODE_2_RELEASE_DATE = Date(dateString: "2011-04-24")

class EpisodeTests: XCTestCase {
    var episode1: Episode!
    var episode2: Episode!
    
    override func setUp() {
        super.setUp()
        
        episode1 = Episode(title: EPISODE_1_NAME, releaseDate: EPISODE_1_RELEASE_DATE)
        episode2 = Episode(title: EPISODE_2_NAME, releaseDate: EPISODE_2_RELEASE_DATE)
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testEpisodeExistence() {
        XCTAssertNotNil(episode1)
    }
    
    // MARK: - Equatable Tests
    func testEpisodeEquality() {
        // Identiidad
        XCTAssertEqual(episode1, episode1)
        
        // Igualdad
        let copyOfEpisode = Episode(title: EPISODE_1_NAME, releaseDate: EPISODE_1_RELEASE_DATE)
        XCTAssertEqual(episode1, copyOfEpisode)
        
        // Desigualdad
        let anotherEpisode = Episode(title: "pfssdfad", releaseDate: EPISODE_1_RELEASE_DATE)
        XCTAssertNotEqual(episode1, anotherEpisode) // Debe coincidir el nombre
        
        let dateMismatchEpisode = Episode(title: EPISODE_1_NAME, releaseDate: Date(dateString: "2012-01-01"))
        XCTAssertNotEqual(episode1, dateMismatchEpisode)
    }
    
    // MARK: - CustomStringConvertible Tests
    func testEpisodeDescription() {
        XCTAssertEqual(episode1.description, "1x01 Winter is Coming")
        
        let mySeason = Season(title: "Season One", releaseDate: Date(dateString: "2011-04-17"), episodes: episode1)
    
        XCTAssertNotNil(mySeason)
        XCTAssertEqual(episode1.description, "Season One. 1x01 Winter is Coming")
        
    }
    
    // MARK: - Hashable Tests
    func testEpisodeHashValue() {
        XCTAssertNotNil(episode1.hashValue)
    }
    
    // MARK: - Comparable Tests
    func testEpisodeComparison() {
        XCTAssertLessThan(episode1, episode2)
    }
    
    func testEpisodeComparison_comparedByReleaseDate() {
        let e1 = Episode(title: "A", releaseDate: Date(dateString: "2018-01-02"))
        let e2 = Episode(title: "A", releaseDate: Date(dateString: "2018-01-01"))
        XCTAssertLessThan(e2, e1)
    }
    
}
