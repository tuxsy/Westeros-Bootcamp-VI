//
//  SeasonTests.swift
//  WesterosTests
//
//  Created by Bruno Anglés Robles on 12/3/18.
//  Copyright © 2018 Alexandre Freire. All rights reserved.
//

import XCTest
@testable import Westeros


let SEASON_ONE_NAME = "Season 1"
let SEASON_ONE_RELEASE_DATE = Date(dateString: "2011-04-17")

let SEASON_TWO_NAME = "Season 2"
let SEASON_TWO_RELEASE_DATE = Date(dateString: "2012-04-01")

class SeasonTests: XCTestCase {
    
    var seasonOne: Season!
    var episode1x1: Episode!
    var episode1x2: Episode!
    
    var seasonTwo: Season!
    var episode2x1: Episode!
    
    
    override func setUp() {
        super.setUp()
        episode1x1 = Episode(title: "1x01 Winter Is Coming", releaseDate: Date(dateString: "2011-04-17"))
        episode1x2 = Episode(title: "1x02 The Kingsroad", releaseDate: Date(dateString: "2011-04-24"))
        seasonOne = Season(title: SEASON_ONE_NAME, releaseDate: SEASON_ONE_RELEASE_DATE, episodes: episode1x1, episode1x2)
        
        episode2x1 = Episode(title: "2x01 The North remembes", releaseDate: SEASON_TWO_RELEASE_DATE)
        seasonTwo = Season(title: SEASON_TWO_NAME, releaseDate: SEASON_TWO_RELEASE_DATE, episodes: episode2x1)
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testSeasonExistence() {
        XCTAssertNotNil(seasonOne)
    }
    
    func testSessionTitle() {
        XCTAssertNotNil(seasonOne.title)
    }
    
    func testCountEpisodes(){
        XCTAssertEqual(seasonOne.count, 2)
    }
    
    func testSeasonRefernceInEpisodes() {
        XCTAssertNotNil(episode1x1.season)
        XCTAssertNotNil(episode1x2.season)
        
        XCTAssertEqual(seasonOne, episode1x1.season)
        XCTAssertEqual(seasonOne, episode1x2.season)
    }
    
    // MARK: - Equatable Tests
    func testSeasonEquality() {
        // Identidad
        XCTAssertEqual(seasonOne, seasonOne)
        
        // Igualdad
        let copyOfSeasonOne = Season(title: SEASON_ONE_NAME, releaseDate: SEASON_ONE_RELEASE_DATE, episodes: episode1x1, episode1x2)
        XCTAssertEqual(seasonOne, copyOfSeasonOne)
        
        // Desigualdad
        let anotherSession = Season(title: "test", releaseDate: SEASON_ONE_RELEASE_DATE, episodes: episode1x1, episode1x2)
        XCTAssertNotEqual(seasonOne, anotherSession) // El nombre de la sesión debe coincidir
        
        let dateMismatchSeason = Season(title: SEASON_ONE_NAME, releaseDate: Date(dateString: "2011-01-01"), episodes: episode1x1, episode1x2)
        XCTAssertNotEqual(seasonOne, dateMismatchSeason) // La fecha de lanzamiento debe ser igual
        
        let episodesCountMismatchSeason = Season(title: SEASON_ONE_NAME, releaseDate: SEASON_ONE_RELEASE_DATE, episodes: episode1x1)
        XCTAssertNotEqual(seasonOne, episodesCountMismatchSeason) // La cantidad de episodios deben ser iguales
        
        let episdodesNameMismatchSeason = Season(title: SEASON_ONE_NAME, releaseDate: SEASON_ONE_RELEASE_DATE, episodes:
            Episode(title: "A", releaseDate: Date(dateString: "2011-01-01")),
                                                 Episode(title: "B", releaseDate: Date(dateString: "2011-01-02"))
        )
        XCTAssertNotEqual(seasonOne, episdodesNameMismatchSeason) // Los episiodios deben ser los mismos
    }
    
    // MARK: - CustomStringConvertibleTests
    func testSeasonDescription() {
        XCTAssertEqual(seasonOne.description, SEASON_ONE_NAME)
    }
    
    // MARK: - Hashable Tests
    func testSeasonHashValue() {
        XCTAssertNotNil(seasonOne.hashValue)
    }
    
    
    // MARK: - Comparable
    func testSeasonComparison() {
        XCTAssertLessThan(seasonOne, seasonTwo)
    }
    
    func testSeasonComparison_comparedByReleaseDate() {
        let s1 = Season(title: "A", releaseDate: Date(dateString: "2018-01-02"), episodes: Episode(title: "Ax01", releaseDate: Date(dateString: "2018-01-02")))
        let s2 = Season(title: "B", releaseDate: Date(dateString: "2018-01-01"), episodes: Episode(title: "Bx01", releaseDate: Date(dateString: "2018-01-01")))
        
        XCTAssertLessThan(s2, s1)
    }
}