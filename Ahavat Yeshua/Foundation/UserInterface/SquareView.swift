//
//  SquareView.swift
//  Ahavat Yeshua
//
//  Created by Ilia Pavlov on 9/21/23.
//

import SwiftUI

struct SquareView: View {
    var iconName: String
    var label: String
    var backgroundColor: Color? = .white
    var foregroundColor: Color? = .blue
    var overlayText: String? = nil

    var body: some View {
        ZStack {
            VStack(spacing: 12) {
                if !iconName.isEmpty {
                    Image(systemName: iconName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 100)
                }

                Text(label)
                    .font(.headline)
                    .multilineTextAlignment(.center)
            }
            .frame(width: 180, height: 180)
            .foregroundColor(foregroundColor)
            .background(backgroundColor)
            .cornerRadius(16)
            .shadow(radius: 6)

            if let overlayText = overlayText {
                Color.white.opacity(0.7)
                    .cornerRadius(16)

                Text(overlayText)
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundColor(.gray)
            }
        }
    }
}



#Preview {
    SquareView(iconName: "link", label: "Link")
}
