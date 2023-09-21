//
//  ExploreView.swift
//  Ahavat Yeshua
//
//  Created by Ilia Pavlov on 9/20/23.
//

import SwiftUI

struct ExploreView: View {
    var body: some View {
        NavigationStack {
            WebView(url: URL(string: "https://chat.openai.com/#")!)
        }
    }
}



#Preview {
    ExploreView()
}
