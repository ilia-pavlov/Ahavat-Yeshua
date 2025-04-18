//
//  ExploreView.swift
//  Ahavat Yeshua
//
//  Created by Ilia Pavlov on 9/20/23.
//
// 

import SwiftUI

struct ExploreView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(
                    gradient: Gradient(colors: [.blue, .purple]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .edgesIgnoringSafeArea(.all)
                
                List {
                    NavigationLink("📖 Faith-Based Quiz", destination: FaithQuizView())
                    NavigationLink("🎯 Mini Challenges", destination: MiniChallengesView())
                }
                .listRowBackground(Color.clear) // makes rows transparent
                .scrollContentBackground(.hidden) // hides default background
            }
        }
    }
}

#Preview {
    ExploreView()
}
