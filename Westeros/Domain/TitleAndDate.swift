//
//  TitleAndDate.swift
//  Westeros
//
//  Created by Bruno Anglés Robles on 12/3/18.
//  Copyright © 2018 Alexandre Freire. All rights reserved.
//

import Foundation

// MARK: - Clase abtracta para título y fecfha de lanzamiento
class TitleAndDate {
    let title: String
    let releaseDate: Date
    
    init(title: String, releaseDate: Date) {
        self.title = title
        self.releaseDate = releaseDate
    }
}

// MARK: - Proxies
extension TitleAndDate {
    @objc var proxyForEquality: String {
        return "\(self.title)###\(self.releaseDate.asString())"
    }
    
    var proxyForComparison: Date {
        return self.releaseDate
    }
}

// MARK: - Equatable
extension TitleAndDate: Equatable {
    static func ==(lhs: TitleAndDate, rhs: TitleAndDate) -> Bool {
        return lhs.proxyForEquality == rhs.proxyForEquality
    }
}


// MARK: - Comparable
extension TitleAndDate: Comparable {
    static func <(lhs: TitleAndDate, rhs: TitleAndDate) -> Bool {
        return lhs.proxyForComparison < rhs.proxyForComparison
    }
    
    
}

// MARK: - Hashable
extension TitleAndDate: Hashable {
    var hashValue: Int {
        return self.proxyForEquality.hashValue
    }
}
