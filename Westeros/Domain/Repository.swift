//
//  Repository.swift
//  Westeros
//
//  Created by Alexandre Freire on 13/02/2018.
//  Copyright © 2018 Alexandre Freire. All rights reserved.
//

import UIKit


enum HousesName: String {
    case Stark = "Stark"
    case Lannister = "Lannister"
    case Targaryen = "Targaryen"
}

final class Repository {
    static let local = LocalFactory()
}

protocol HouseFactory {
    
    typealias HouseFilter = (House) -> Bool
    typealias SeasonFilter = (Season) -> Bool
    
    var houses: [House] { get }
    func house(named: String) -> House?
    func house(named: HousesName) -> House?
    func houses(filteredBy: HouseFilter) -> [House]
    
    var seasons: [Season] {get}
    func seasons(filteredBy: SeasonFilter) -> [Season]
}

final class LocalFactory: HouseFactory {
    
    var houses: [House] {
        return loadHousesData().sorted()
    }
    
    func house(named name: String) -> House? {
        let house = houses.filter{ $0.name.uppercased() == name.uppercased() }.first
        return house
    }
    
    func house(named: HousesName) -> House? {
        return house(named: named.rawValue)
    }
    
    
    func houses(filteredBy: HouseFilter) -> [House] {
        return houses.filter(filteredBy)
    }
    
    var seasons: [Season] {
        return loadSeasonsData().sorted()
    }
    
    func seasons(filteredBy: SeasonFilter) -> [Season] {
        return seasons.filter(filteredBy)
    }
    
    
    // MARK: - Houses Data Loader
    func loadHousesData() -> [House] {
        // Houses creation here
        let starkSigil = Sigil(image: UIImage(named: "codeIsComing.png")!, description: "Lobo Huargo")
        let lannisterSigil = Sigil(image: #imageLiteral(resourceName: "lannister.jpg"), description: "León rampante")
        let targaryenSigil = Sigil(image: UIImage(named: "targaryenSmall.jpg")!, description: "Dragón Tricéfalo")
        
        let starkHouse = House(name: HousesName.Stark.rawValue, sigil: starkSigil, words: "Se acerca el invierno", url: URL(string: "https://awoiaf.westeros.org/index.php/House_Stark")! )
        let lannisterHouse = House(name: HousesName.Lannister.rawValue, sigil: lannisterSigil, words: "Oye mi rugido", url: URL(string: "https://awoiaf.westeros.org/index.php/House_Lannister")!)
        let targaryenHouse = House(name: HousesName.Targaryen.rawValue, sigil: targaryenSigil, words: "Fuego y Sangre", url: URL(string: "https://awoiaf.westeros.org/index.php/House_Targaryen")!)
        
        let robb = Person(name: "Robb", alias: "El Joven Lobo", house: starkHouse)
        let arya = Person(name: "Arya", house: starkHouse)
        
        let tyrion = Person(name: "Tyrion", alias: "El Enano", house: lannisterHouse)
        let cersei = Person(name: "Cersei", house: lannisterHouse)
        let jaime = Person(name: "Jaime", alias: "El Matarreyes", house: lannisterHouse)
        
        let dani = Person(name: "Daenerys", alias: "Madre de Dragones", house: targaryenHouse)
        
        // Add characters to houses
        starkHouse.add(person: arya)
        starkHouse.add(person: robb)
        lannisterHouse.add(person: tyrion)
        lannisterHouse.add(person: cersei)
        lannisterHouse.add(person: jaime)
        targaryenHouse.add(person: dani)
        
        return [starkHouse, lannisterHouse, targaryenHouse]
    }
    
    func loadSeasonsData() -> [Season]{
        let season1 = Season(title: "Season One", releaseDateString: "2011-04-17", episodes: Episode(title: "Winter is Coming", releaseDateString: "2011-04-17",urlString: "https://en.wikipedia.org/wiki/Winter_Is_Coming"), Episode(title: "The Kingsroad", releaseDateString: "2011-04-24",urlString: "https://en.wikipedia.org/wiki/The_Kingsroad"))
        
        
        let season2 = Season(title: "Season Two", releaseDateString: "2012-04-01", episodes: Episode(title: "The North Remembers", releaseDateString: "2012-04-01", urlString: "https://en.wikipedia.org/wiki/The_North_Remembers"), Episode(title: "The Night Lands", releaseDateString: "2012-04-08", urlString: "https://en.wikipedia.org/wiki/The_Night_Lands"))
        
        let season3 = Season(title: "Season Three", releaseDateString: "2013-03-31", episodes: Episode(title: "Valar Dohaeris", releaseDateString: "2013-03-31", urlString: "https://en.wikipedia.org/wiki/Valar_Dohaeris"), Episode(title: "Dark Wings, Dark Words", releaseDateString: "2013-04-07", urlString: "https://en.wikipedia.org/wiki/Dark_Wings,_Dark_Words"))
        
        let season4 = Season(title: "Season Four", releaseDateString: "2014-04-06", episodes: Episode(title: "Two Swords", releaseDateString: "2014-04-06",urlString: "https://en.wikipedia.org/wiki/Two_Swords_(Game_of_Thrones)"), Episode(title: "The Lion and the Rose", releaseDateString: "2014-04-13", urlString: "https://en.wikipedia.org/wiki/The_Lion_and_the_Rose"))
        
        let season5 = Season(title: "Season Five", releaseDateString: "2015-04-12", episodes: Episode(title: "The Wars to Come", releaseDateString: "2015-04-12", urlString: "https://en.wikipedia.org/wiki/The_Wars_to_Come"), Episode(title: "The House of Black and White", releaseDateString: "2015-04-19", urlString: "https://en.wikipedia.org/wiki/The_House_of_Black_and_White"))
        
        let season6 = Season(title: "Season Six", releaseDateString: "2016-04-24", episodes: Episode(title: "The Red Woman", releaseDateString: "2016-04-24", urlString: "https://en.wikipedia.org/wiki/The_Red_Woman"), Episode(title: "Home", releaseDateString: "2016-05-01", urlString: "https://en.wikipedia.org/wiki/Home_(Game_of_Thrones)"))
        
        let season7 = Season(title: "Season Seven", releaseDateString: "2017-06-16", episodes: Episode(title: "Dragonstone", releaseDateString: "2017-06-16", urlString: "https://en.wikipedia.org/wiki/Dragonstone_(Game_of_Thrones)"), Episode(title:     "Stormborn", releaseDateString: "2017-06-23", urlString: "https://en.wikipedia.org/wiki/Stormborn"))
        
        return [season1, season2, season3, season4,season5, season6, season7]
    }
    
}








