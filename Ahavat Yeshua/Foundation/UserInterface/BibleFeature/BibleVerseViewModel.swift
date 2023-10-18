//
//  BibleVerseViewModel.swift
//  Ahavat Yeshua
//
//  Created by Ilia Pavlov on 9/21/23.
//

import SwiftUI

import SwiftUI

class BibleVerseViewModel: ObservableObject {
    @Published var verse: BibleVerseModel?
    @Published var passage = ""
    @Published var showAlert = false
    @Published var alertMessage = ""
    @Published var verseText = ""
    @Published var verseReference = ""
    
    private var randomQuery: String = "?random=verse"
    
    func fetchVerse(random: Bool = false) {
        Task {
            do {
                let fetchedVerse = try await BibleNetwork.shared.fetchVerse(for: random ? randomQuery : passage)
                DispatchQueue.main.async { // Switch to the main thread
                    self.verse = fetchedVerse
                }
            } catch {
                DispatchQueue.main.async { // Switch to the main thread
                    self.alertMessage = "Error: \(error)"
                    self.showAlert = true
                }
            }
        }
    }
}

