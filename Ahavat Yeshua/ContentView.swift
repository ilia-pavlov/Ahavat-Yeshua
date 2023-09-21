//
//  ContentView.swift
//  Ahavat Yeshua
//
//  Created by Ilia Pavlov on 9/20/23.
//

import SwiftUI

struct ContentView: View {
    @State private var isTabBarHidden = false
    
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    TabBarItem(icon: .house)
                }
            BibleStudyView()
                .tabItem {
                    TabBarItem(icon: .book)
                    
                }
            ExploreView()
                .tabItem {
                    TabBarItem(icon: .globe)
                }
        }
    }
}

#Preview {
    ContentView()
}
