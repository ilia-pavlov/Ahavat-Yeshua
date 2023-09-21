//
//  SFSymbols.swift
//  Ahavat Yeshua
//
//  Created by Ilia Pavlov on 9/20/23.
//

import Foundation

enum SFSymbols: String {
    case house, book, globe
    
    var key: String {
        self.rawValue
    }
    
    var value: String {
        switch self {
        case .house:
            "Home"
        case .book:
            "Bible Study"
        case .globe:
            "Explore"
        }
    }
}

