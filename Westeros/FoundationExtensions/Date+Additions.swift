//
//  Date+Additions.swift
//  Westeros
//
//  Created by Bruno Anglés Robles on 12/3/18.
//  Copyright © 2018 Alexandre Freire. All rights reserved.
//

import Foundation

let DATE_FORMAT = "yyyy-MM-dd"
let DATE_LOCALE = "en_US_POSIX"

private struct DateFormatBuilder {
    static func build() -> DateFormatter {
        let dateStringFormatter = DateFormatter()
        dateStringFormatter.dateFormat = DATE_FORMAT
        dateStringFormatter.locale = Locale(identifier: DATE_LOCALE)
        return dateStringFormatter;
    }
}

extension Date {
    
    init(dateString:String) {
        let d = DateFormatBuilder.build().date(from: dateString)!
        self.init(timeInterval:0, since:d)
    }
    
    func asString() -> String{
        
        return DateFormatBuilder.build().string(from: self)
    }
}
