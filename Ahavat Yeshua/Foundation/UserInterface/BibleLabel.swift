//
//  BibleLabel.swift
//  Ahavat Yeshua
//
//  Created by Ilia Pavlov on 4/18/25.
//

import SwiftUI

struct BibleLabel: View {
    var title: String
    var systemImage: String = "book.fill"
    var comingSoon: Bool = false
    var color: Color = .purple
    
    var body: some View {
        HStack {
            Label(title, systemImage: systemImage)
                .foregroundColor(color)
            Spacer()
            if comingSoon {
                Text("Coming Soon")
                    .font(.caption)
                    .foregroundColor(.gray)
                    .padding(6)
                    .background(Color.green.opacity(0.15))
                    .clipShape(Capsule())
            }
        }
        .padding(.vertical, 6)
    }
}
