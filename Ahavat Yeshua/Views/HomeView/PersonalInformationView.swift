//
//  PersonalInformationView.swift
//  Ahavat Yeshua
//
//  Created by Ilia Pavlov on 9/21/23.
//

import SwiftUI

struct PersonalInformationView: View {
    @State private var isEditing = false
    @State private var name = ""
    @State private var email = ""
    @State private var birthDate = Date()
    @State private var address = ""
    @State private var phone = ""
    @State private var isPickerPresented = false
    @ObservedObject private var userSettings = UserSettings.shared

    var body: some View {
        List {
            Section(header: Text("Personal Information")) {
                if isEditing {
                    TextField("Full Name", text: $userSettings.name)
                    EmailInputView(email: $userSettings.email)
                    Button(action: {
                        isPickerPresented = true
                    }) {
                        Text("Date of Birth: \(formattedBirthDate)")
                    }
                } else {
                    Text("Full Name: \(userSettings.name)")
                    Text("Email: \(userSettings.email)")
                    Text("Date of Birth: \(formattedBirthDate)")
                }
            }

            Section(header: Text("Contact Information")) {
                if isEditing {
                    TextField("Address", text: $userSettings.address)
                    TextField("Phone", text: $userSettings.phone)
                } else {
                    Text("Address: \(userSettings.address)")
                    Text("Phone: \(userSettings.phone)")
                }
            }

            Section(header: Text("Actions")) {
                Button(action: toggleEdit) {
                    Text(isEditing ? "Save" : "Edit")
                }
            }
            
            Button(action: userSettings.cleanAll) {
                Text("Clear All")
                    .foregroundColor(.red)
            }
        }
        .listStyle(GroupedListStyle())
        .navigationBarTitle("My Profile")
        .sheet(isPresented: $isPickerPresented) {
                        DOBView(birthDate: $birthDate,
                                isPickerPresented: $isPickerPresented)
            }
    }

    func toggleEdit() {
        isEditing.toggle()
    }
    
    var formattedBirthDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        return dateFormatter.string(from: birthDate)
    }
}


#Preview {
    PersonalInformationView()
}
