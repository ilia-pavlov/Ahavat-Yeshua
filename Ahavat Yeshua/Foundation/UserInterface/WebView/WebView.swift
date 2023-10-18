//
//  WebView.swift
//  Ahavat Yeshua
//
//  Created by Ilia Pavlov on 9/20/23.
//

import SwiftUI

struct WebView: View {
    let url: String

    var body: some View {
        NavigationView {
            let urlFormat: URL = URL(string: url)!
            WebViewRepresentable(urlString: urlFormat.absoluteString)
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

