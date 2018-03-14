//
//  Season.swift
//  Westeros
//
//  Created by Bruno Anglés Robles on 12/3/18.
//  Copyright © 2018 Alexandre Freire. All rights reserved.
//

import Foundation

// MARK: - Season Properties && Init
/*
 * La implementación de los siguientes protocolos le viene dada al extender de TitleAndDate
 * - Equatable
 * - Comparable
 * - Hashable
 */
final class Season: TitleAndDate{
    let episodes: [Episode]
    
    init(title: String, releaseDateString: String, episodes: Episode...) {
        self.episodes = episodes
        super.init(title: title, releaseDate: Date(dateString: releaseDateString))
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
