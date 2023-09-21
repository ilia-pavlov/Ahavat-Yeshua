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

struct SquareView: View {
    var iconName: String
    var label: String
    
    var body: some View {
        VStack {
            Image(systemName: iconName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 80, height: 80)
                .foregroundColor(.blue)
            
            Text(label)
                .font(.headline)
                .multilineTextAlignment(.center)
        }
        .frame(width: 160, height: 160)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}

#Preview {
    HomeView()
}
