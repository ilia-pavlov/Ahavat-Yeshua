//
//  WebView.swift
//  Ahavat Yeshua
//
//  Created by Ilia Pavlov on 9/20/23.
//

import SwiftUI

struct WebView: View {
    @State private var isLoading = true
    let url: String

    var body: some View {
        ZStack {
            let urlFormat: URL = URL(string: url)!
            WebViewRepresentable(urlString: urlFormat.absoluteString)
                .navigationBarTitleDisplayMode(.inline)
        }
        
        if isLoading {
            VStack {
                Spacer()
                ProgressView("Loading...")
                    .progressViewStyle(.circular)
                    .foregroundStyle(.gray)
                    .scaleEffect(2.0, anchor: .center)
                    .onAppear {
                        Timer.scheduledTimer(withTimeInterval: 5, repeats: false) { _ in
                            isLoading = false
                        }
                    }
                Spacer()
            }
        }
    }
}

