//
//  BibleVerseModel.swift
//  Ahavat Yeshua
//
//  Created by Ilia Pavlov on 9/21/23.
//

import Foundation

struct BibleVerseModel: Codable, Identifiable {
    var id: String { reference }
    let reference: String
    let text: String
    
    enum CodingKeys: String, CodingKey {
        case reference
        case text
    }
}

