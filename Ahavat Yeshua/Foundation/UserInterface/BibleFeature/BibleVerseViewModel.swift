//
//  BibleVerseViewModel.swift
//  Ahavat Yeshua
//
//  Created by Ilia Pavlov on 9/21/23.
//

import SwiftUI

enum LoadState {
    case loaded
    case loading
    case error
}

class BibleVerseViewModel: ObservableObject {
    @Published var verse: BibleVerseModel?
    @Published var passage = ""
    @Published var showAlert = false
    @Published var alertMessage = ""
    @Published var verseText = ""
    @Published var verseReference = ""
    
    private var randomQuery: String = "?random=verse"
        
    @MainActor
    func fetchVerse(random: Bool = false) {
        let formattedPassage: String = passage.replacingOccurrences(of: " ", with: "%20")
        Task {
            do {
                self.verse = try await BibleNetwork.shared.fetchVerse(for: random ? randomQuery : formattedPassage)
            } catch let error {
                self.alertMessage = "Error: \(error)"
                self.showAlert = true
                print("Error: \(error.localizedDescription.debugDescription)")
            }
        }
    }
}

