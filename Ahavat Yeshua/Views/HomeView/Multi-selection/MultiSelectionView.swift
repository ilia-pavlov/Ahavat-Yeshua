//
//  MultiSelectionView.swift
//  Ahavat Yeshua
//
//  Created by Ilia Pavlov on 4/17/25.
//

import SwiftUI

struct MultiSelectionView: View {
    @State private var selectedOptions: Set<String> = []
    private let allOption = "All"
    private let options = ["Worship", "Prayer", "Kids", "Youth", "Bible Study", "Outreach", "Events", "Volunteering"]

    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Text("Select Activities")
                    .font(.title2)
                    .padding(.top)

                // "All" Button
                Button(action: {
                    if selectedOptions.contains(allOption) {
                        selectedOptions.remove(allOption)
                    } else {
                        selectedOptions = [allOption]
                    }
                }) {
                    Text(allOption)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(selectedOptions.contains(allOption) ? Color.blue : Color.gray.opacity(0.2))
                        .foregroundColor(selectedOptions.contains(allOption) ? .white : .primary)
                        .cornerRadius(12)
                }

                // Grid of other options
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                    ForEach(options, id: \.self) { option in
                        Button(action: {
                            if selectedOptions.contains(option) {
                                selectedOptions.remove(option)
                            } else {
                                selectedOptions.insert(option)
                            }

                            // Unselect "All"
                            selectedOptions.remove(allOption)
                        }) {
                            Text(option)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(selectedOptions.contains(option) ? Color.green : Color.gray.opacity(0.2))
                                .foregroundColor(selectedOptions.contains(option) ? .white : .primary)
                                .cornerRadius(12)
                        }
                    }
                }

                Spacer()

                // NEXT BUTTON
                NavigationLink(destination: SelectionSummaryView(selectedItems: Array(selectedOptions))) {
                    Text("Next")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(selectedOptions.isEmpty ? Color.gray : Color.accentColor)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                }
                .disabled(selectedOptions.isEmpty)
            }
            .padding()
        }
    }
}


#Preview {
    MultiSelectionView()
}
