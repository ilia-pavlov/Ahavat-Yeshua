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
    
    var body: some View {
        VStack {
            Image(systemName: iconName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 80, height: 80)
                .foregroundColor(foregroundColor)
            
            Text(label)
                .font(.headline)
                .multilineTextAlignment(.center)
        }
        .frame(width: 160, height: 160)
        .background(backgroundColor)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}

#Preview {
    SquareView(iconName: "link", label: "Link")
}
