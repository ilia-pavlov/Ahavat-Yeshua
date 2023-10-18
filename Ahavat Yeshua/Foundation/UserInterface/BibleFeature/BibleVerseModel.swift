//
//  BibleVerseModel.swift
//  Ahavat Yeshua
//
//  Created by Ilia Pavlov on 9/21/23.
//

import Foundation

public struct BibleVerseModel: Codable, Identifiable {
    public var id: String { reference }
    let reference: String
    let text: String
    
    enum CodingKeys: String, CodingKey {
        case reference
        case text
    }
}

