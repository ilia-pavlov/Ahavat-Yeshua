//
//  BibleVerseView.swift
//  Ahavat Yeshua
//
//  Created by Ilia Pavlov on 9/21/23.
//

import SwiftUI

struct BibleVerseView: View {
    @ObservedObject private var viewModel = BibleVerseViewModel()
    @State private var showReference = false
    
    var body: some View {
        VStack {
            TextField("Enter Bible Passage - John 3:16", text: $viewModel.passage)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())

            HStack {
                Button("Show Verse") {
                    viewModel.fetchVerse()
                    hideKeyboard()
                    showReference = false
                }
                .fontWeight(.bold)
                .padding()
                .background(Color.green)
                .foregroundColor(.white)
                .cornerRadius(10)
                
                Button("Random Verse") {
                    viewModel.fetchVerse(random: true)
                    hideKeyboard()
                    showReference = true
                    viewModel.passage = ""
                }
                .fontWeight(.bold)
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
            }

            VStack {
                if let verse = viewModel.verse {
                    Text(verse.text)
                        .font(.title2)
                        .padding()
                    if showReference {
                        Text(verse.reference)
                            .font(.title)
                            .bold()
                    }
                }
            }

        }
        .padding()
        .alert(isPresented: $viewModel.showAlert) {
            if viewModel.passage.isEmpty {
                return Alert(
                    title: Text("Error"),
                    message: Text("Forgot to put passage?"),
                    dismissButton: .default(Text("Let me try!"))
                )
            } else {
                // Alert for other invalid input
                return Alert(
                    title: Text("Error"),
                    message: Text("Invalid Format - (\(viewModel.passage)), Please use the format (John 3:16')"),
                    dismissButton: .default(Text("OK")) {
                        viewModel.passage = "John 3:16"
                    }
                )
            }
        }
    }
    
    // Function to hide the keyboard
    private func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

#Preview {
    BibleVerseView()
}
