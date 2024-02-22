//
//  HomeView.swift
//  Ahavat Yeshua
//
//  Created by Ilia Pavlov on 9/20/23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Spacer()
                Text("Welcome to Our Church")
                    .font(.title)
                    .accessibilityIdentifier("homeView_title")
                                
                HStack(spacing: 20) {
                    NavigationLink(destination: BibleReadingView()) {
                        SquareView(iconName: "book", 
                                   label: "Bible Reading",
                                   foregroundColor: .green)
                    }
                    
                    NavigationLink(destination: ProfileView()) {
                        SquareView(iconName: "person.circle", 
                                   label: "Profile")
                    }
                }
                
                HStack(spacing: 20) {
                    NavigationLink(destination: DonationView()) {
                        SquareView(iconName: "creditcard", 
                                   label: "Donation",
                                   foregroundColor: .orange)
                    }
                    
                    NavigationLink(destination: LiveStreamView()) {
                        SquareView(iconName: "play.circle",
                                   label: "Live Stream",
                                   foregroundColor: .red)
                    }
                }
                
                Spacer()
            }
            .navigationBarHidden(true)
        }
    }
}

#Preview {
    HomeView()
}
