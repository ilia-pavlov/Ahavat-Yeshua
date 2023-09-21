//
//  BibleReadingView.swift
//  Ahavat Yeshua
//
//  Created by Ilia Pavlov on 9/20/23.
//

import SwiftUI

struct BibleReadingView: View {
    @State private var verseReference = ""
    @State private var loadedVerse: String?
    
    var body: some View {
        VStack {
            TextField("Enter Bible Verse (e.g., John 3:16)", text: $verseReference)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button(action: loadVerse) {
                Text("Load Verse")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            
            if let loadedVerse = loadedVerse {
                Text("Verse:")
                Text(loadedVerse)
                    .fontWeight(.bold)
            }
        }
    }
    
    func loadVerse() {
        self.loadedVerse = "Work in progress"
        // TODO: write Network call to https://bible-api.com
    }
}

struct VerseResponse: Decodable {
    let text: String
}

#Preview {
    BibleReadingView()
}
