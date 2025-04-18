//
//  BibleStudyView.swift
//  Ahavat Yeshua
//
//  Created by Ilia Pavlov on 9/20/23.
//

import SwiftUI

struct BibleStudyView: View {
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [.blue, .purple]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .edgesIgnoringSafeArea(.all)
            
            
            VStack {
                VStack(spacing: 4) {
                    Text(" Growth in Faith")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundColor(.primary)
                    Text("צמיחה באמונה")
                        .foregroundStyle(.black)
                        .foregroundColor(.secondary)
                }
                .multilineTextAlignment(.center)
                
                List {
                    Section {
                        Link(destination: URL(string: "https://www.youtube.com/watch?v=zVLKnHs5nFY&list=PLqF5Pt_yMO7lcUN6hHO1udbYfAXaeDdJc")!) {
                            Label("Book of Malachi", systemImage: "video.fill")
                                .foregroundColor(.blue)
                                .padding(.vertical, 6)
                        }

                        Link(destination: URL(string: "https://www.youtube.com/watch?v=7gM0bgin0O0&list=PLqF5Pt_yMO7lYb0Sym42iT42cdevaFwFx")!) {
                            Label("Book of Daniel", systemImage: "video.fill")
                                .foregroundColor(.blue)
                                .padding(.vertical, 6)
                        }

                        Link(destination: URL(string: "https://www.youtube.com/watch?v=6_2IqOlbfhU&list=PLqF5Pt_yMO7mdHHR3PWx7EN60Or7MNYPi")!) {
                            Label("Book of Isaiah", systemImage: "video.fill")
                                .foregroundColor(.blue)
                                .padding(.vertical, 6)
                        }
                    } header: {
                        Text("📜 Old Testament")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding(.top)
                    }
                    Section {
                        Label("1 Peter", systemImage: "book.fill")
                            .foregroundColor(.purple)
                            .padding(.vertical, 6)

                        Label("Acts", systemImage: "book.fill")
                            .foregroundColor(.purple)
                            .padding(.vertical, 6)

                        Label("Galatians", systemImage: "book.fill")
                            .foregroundColor(.purple)
                            .padding(.vertical, 6)
                    } header: {
                        Text("📖 New Testament")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding(.top)
                    }
                }
            }
            .scrollContentBackground(.hidden) // Remove default list background
        }
    }
}

#Preview {
    BibleStudyView()
}
