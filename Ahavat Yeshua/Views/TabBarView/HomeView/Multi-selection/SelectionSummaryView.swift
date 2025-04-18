//
//  SelectionSummaryView.swift
//  Ahavat Yeshua
//
//  Created by Ilia Pavlov on 4/17/25.
//

import SwiftUI

import SwiftUI

struct SelectionSummaryView: View {
    let selectedItems: [String]

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("You selected:")
                .font(.title2)
                .bold()

            Text("🎉 Great choices!")
                .font(.subheadline)
                .foregroundColor(.gray)

            ScrollView {
                VStack(spacing: 12) {
                    ForEach(selectedItems, id: \.self) { item in
                        HStack {
                            Image(systemName: "checkmark.circle.fill")
                                .foregroundColor(.green)
                            Text(item)
                                .font(.body)
                            Spacer()
                        }
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(12)
                    }
                }
            }

            Spacer()
        }
        .padding()
        .navigationTitle("Summary")
    }
}


#Preview {
    SelectionSummaryView(selectedItems: ["YES", "NO"])
}
