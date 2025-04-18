//
//  TodoView.swift
//  Ahavat Yeshua
//
//  Created by Ilia Pavlov on 4/17/25.
//

import SwiftUI

struct TodoView: View {
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "hammer.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .foregroundColor(.orange)
            
            Text("Work in Progress")
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(.primary)
            
            Text("We're building this feature. Please check back soon!")
                .font(.body)
                .multilineTextAlignment(.center)
                .foregroundColor(.secondary)
                .padding(.horizontal)
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(LinearGradient(gradient: Gradient(colors: [.blue, .purple]), startPoint: .topLeading, endPoint: .bottomTrailing))
    }
}

#Preview {
    TodoView()
}

