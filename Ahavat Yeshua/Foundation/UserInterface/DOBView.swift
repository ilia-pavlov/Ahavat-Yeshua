//
//  DOBView.swift
//  Ahavat Yeshua
//
//  Created by Ilia Pavlov on 9/21/23.
//

import SwiftUI

struct DOBView: View {
    @Binding var birthDate: Date
    @Binding var isPickerPresented: Bool

    var body: some View {
        VStack {
            DatePicker("Select Date of Birth", selection: $birthDate, displayedComponents: [.date])
                .datePickerStyle(WheelDatePickerStyle())
                .labelsHidden()

            Button(action: {
                isPickerPresented = false
            }) {
                Text("Done")
                    .font(.headline)
                    .foregroundColor(.blue)
            }
            .padding()
        }
    }
}

