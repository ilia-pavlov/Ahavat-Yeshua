//
//  ContentView.swift
//  Ahavat Yeshua
//
//  Created by Ilia Pavlov on 9/20/23.
//

import SwiftUI

struct ContentView: View {
    @State private var showSplash = true
    @State private var isTabBarHidden = false
    
    var body: some View {
        TabView {
            HomeView()
                .tabItem { TabBarItem(icon: .house) }
            
            BibleStudyView()
                .tabItem { TabBarItem(icon: .book) }
            
            TodoView()
                .tabItem { TabBarItem(icon: .feed) }
            
            ExploreView()
                .tabItem { TabBarItem(icon: .globe) }
        }
        .onAppear {
            // Hide tab bar initially if needed
            isTabBarHidden = false
        }
    }
}

#Preview {
    ContentView()
}
