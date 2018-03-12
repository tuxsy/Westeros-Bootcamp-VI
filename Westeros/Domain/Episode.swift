//
//  Episode.swift
//  Westeros
//
//  Created by Bruno Anglés Robles on 12/3/18.
//  Copyright © 2018 Alexandre Freire. All rights reserved.
//

import Foundation

// MARK: - Epsode Class && Init
final class Episode: TitleAndDate{
    weak var season: Season?
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


