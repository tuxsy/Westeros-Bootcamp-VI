//
//  Episode.swift
//  Westeros
//
//  Created by Bruno Anglés Robles on 12/3/18.
//  Copyright © 2018 Alexandre Freire. All rights reserved.
//

import Foundation

// MARK: - Epsode Class && Init
/*
 * La implementación de los siguientes protocolos le viene dada al extender de TitleAndDate
 * - Equatable
 * - Comparable
 * - Hashable
 */
final class Episode: TitleAndDate{
    let wikiUrl: URL
    weak var season: Season?
    
    init(title: String, releaseDate: Date, wikiUrl: URL) {
        self.wikiUrl = wikiUrl
        super.init(title: title, releaseDate: releaseDate)
    }
    
    convenience init (title: String, releaseDateString: String, urlString: String) {
        self.init(title: title, releaseDate: Date(dateString: releaseDateString), wikiUrl: URL(string: urlString)!)
    }
    
}

// MARK: - CustomStringConvertible
extension Episode: CustomStringConvertible {
    var description: String {
        if (self.season == nil) {
            return self.title
        } else {
            return "\(self.season!.title). \(self.title)"
        }
    }
}


