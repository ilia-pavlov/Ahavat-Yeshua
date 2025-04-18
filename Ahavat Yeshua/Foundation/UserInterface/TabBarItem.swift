//
//  TabBarItem.swift
//  Ahavat Yeshua
//
//  Created by Ilia Pavlov on 9/20/23.
//

import SwiftUI

struct TabBarItem: View {
    let icon: TabIcon

    enum TabIcon {
        case house, book, feed, globe

        var systemName: String {
            switch self {
            case .house: "house"
            case .book: "book"
            case .globe: "globe"
            case .feed: "newspaper"
            }
        }

        var label: String {
            switch self {
            case .house: "Home"
            case .book: "Bible Study"
            case .globe: "Explore"
            case .feed: "Feed"
            }
        }
    }

    var body: some View {
        VStack {
            Image(systemName: icon.systemName)
            Text(icon.label)
        }
    }
}

#Preview {
    TabBarItem(icon: .book)
}
