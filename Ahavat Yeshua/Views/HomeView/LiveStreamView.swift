//
//  LiveStreamView.swift
//  Ahavat Yeshua
//
//  Created by Ilia Pavlov on 9/20/23.
//

import SwiftUI

struct LiveStreamView: View {
    var body: some View {
        WebView(url: "https://www.youtube.com/@AhavatYeshua/streams")
    }
}

#Preview {
    LiveStreamView()
}
