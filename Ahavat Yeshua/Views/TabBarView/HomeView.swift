//
//  HomeView.swift
//  Ahavat Yeshua
//
//  Created by Ilia Pavlov on 9/20/23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Spacer()
                Text("Welcome to Our Church")
                    .font(.title)
                                
                HStack(spacing: 20) {
                    NavigationLink(destination: BibleReadingView()) {
                        SquareView(iconName: "book", label: "Bible Reading")
                    }
                    
                    NavigationLink(destination: ProfileView()) {
                        SquareView(iconName: "person.circle", label: "Profile")
                    }
                }
                
                HStack(spacing: 20) {
                    NavigationLink(destination: DonationView()) {
                        SquareView(iconName: "creditcard", label: "Donation")
                    }
                    
                    NavigationLink(destination: LiveStreamView()) {
                        SquareView(iconName: "play.circle", label: "Live Stream")
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
