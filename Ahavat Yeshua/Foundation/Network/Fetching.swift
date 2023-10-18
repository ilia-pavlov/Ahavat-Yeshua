//
//  Fetching.swift
//  Ahavat Yeshua
//
//  Created by Ilia Pavlov on 10/17/23.
//

import Foundation

public protocol Fetching {
    func fetchSummary(symbolValue: String) async throws -> BibleVerseModel
}
