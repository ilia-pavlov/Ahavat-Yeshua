//
//  ContentView.swift
//  Ahavat Yeshua
//
//  Created by Ilia Pavlov on 9/20/23.
//

import SwiftUI

struct ContentView: View {
    @State private var isTabBarHidden = false
    @State private var showDevMenu = false

    var body: some View {
        TabView {
            HomeView()
                .tabItem { TabBarItem(icon: .house) }

            BibleStudyView()
                .tabItem { TabBarItem(icon: .book) }

            FeedView()
                .tabItem { TabBarItem(icon: .feed) }

            ExploreView()
                .tabItem { TabBarItem(icon: .globe) }
        }
        .onAppear {
            isTabBarHidden = false
        }
        .onShake {
            showDevMenu = true
        }
        .sheet(isPresented: $showDevMenu) {
            DevMenuView(isPresented: $showDevMenu)
        }
    }
}

#Preview {
    ContentView()
}
