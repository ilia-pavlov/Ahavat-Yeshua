//
//  DevMenuView.swift
//  Ahavat Yeshua
//
//  Created by Ilia Pavlov on 4/18/25.
//

import SwiftUI

struct DevMenuView: View {
    @Binding var isPresented: Bool
    @AppStorage("isMockEnabled") private var isMockEnabled = false
    @AppStorage("showBetaBanner") private var showBetaBanner = true
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Developer Flags")) {
                    Toggle("Enable Mock Mode", isOn: $isMockEnabled)
                    Toggle("Show Beta Banner", isOn: $showBetaBanner)
                }
            }
            .navigationTitle("Developer Menu")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Close") {
                        isPresented = false
                    }
                }
            }
        }
    }
}

#Preview {
    DevMenuView(isPresented: .constant(true))
}
