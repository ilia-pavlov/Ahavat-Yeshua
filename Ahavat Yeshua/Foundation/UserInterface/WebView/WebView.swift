//
//  WebView.swift
//  Ahavat Yeshua
//
//  Created by Ilia Pavlov on 9/20/23.
//

import SwiftUI


struct WebView: View {
    let url: URL

    var body: some View {
        NavigationView {
            WebViewRepresentable(urlString: url.absoluteString)
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}
