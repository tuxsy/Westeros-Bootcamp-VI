//
//  Season.swift
//  Westeros
//
//  Created by Bruno Anglés Robles on 12/3/18.
//  Copyright © 2018 Alexandre Freire. All rights reserved.
//

import Foundation

// MARK: - Season Properties && Init
final class Season: TitleAndDate{
    let episodes: [Episode]
    
    init(title: String, releaseDate: Date, episodes: Episode...) {
        self.episodes = episodes
        super.init(title: title, releaseDate: releaseDate)
        
        self.episodes.forEach{$0.season = self}
    }
}

// MARK: - Session Extension
extension Season {
    var count: Int {
        return self.episodes.count
    }
}

// MARK: - Proxies
extension Season {
    override var proxyForEquality: String {
        return "\(self.title)#\(self.releaseDate.asString())#[\(self.episodes.reduce(""){"\($0)#\($1.title)"})]"
    }
}

// MARK: - CustomStringConvertible
extension Season: CustomStringConvertible {
    var description: String {
        return self.title
    }
}