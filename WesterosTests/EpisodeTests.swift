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
let EPISODE_1_RELEASE_DATE = "2011-04-17"
let EPISODE_2_RELEASE_DATE = "2011-04-24"

class EpisodeTests: XCTestCase {
    var episode1: Episode!
    var episode2: Episode!
    
    override func setUp() {
        super.setUp()
        
        episode1 = Episode(title: EPISODE_1_NAME, releaseDateString: EPISODE_1_RELEASE_DATE, urlString: "https://test.io/episode1")
        episode2 = Episode(title: EPISODE_2_NAME, releaseDateString: EPISODE_2_RELEASE_DATE, urlString: "https://test.io/episode1")
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
        let copyOfEpisode = Episode(title: EPISODE_1_NAME, releaseDateString: EPISODE_1_RELEASE_DATE, urlString: "https://test.io/fake")
        XCTAssertEqual(episode1, copyOfEpisode)
        
        // Desigualdad
        let anotherEpisode = Episode(title: "pfssdfad", releaseDateString: EPISODE_1_RELEASE_DATE, urlString: "https://test.io/fake")
        XCTAssertNotEqual(episode1, anotherEpisode) // Debe coincidir el nombre
        
        let dateMismatchEpisode = Episode(title: EPISODE_1_NAME, releaseDateString: "2012-01-01", urlString: "https://test.io/fake")
        XCTAssertNotEqual(episode1, dateMismatchEpisode)
    }
    
    // MARK: - CustomStringConvertible Tests
    func testEpisodeDescription() {
        XCTAssertEqual(episode1.description, "1x01 Winter is Coming")
        
        let mySeason = Season(title: "Season One", releaseDateString: "2011-04-17", episodes: episode1)
    
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
        let e1 = Episode(title: "A", releaseDateString: "2018-01-02", urlString: "https://test.io/fake")
        let e2 = Episode(title: "A", releaseDateString: "2018-01-01", urlString: "https://test.io/fake")
        XCTAssertLessThan(e2, e1)
    }
    
}
