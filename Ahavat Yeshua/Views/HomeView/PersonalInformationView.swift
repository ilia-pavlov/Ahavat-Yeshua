//
//  PersonalInformationView.swift
//  Ahavat Yeshua
//
//  Created by Ilia Pavlov on 9/21/23.
//

import SwiftUI

struct PersonalInformationView: View {
    var body: some View {
        List {
            Section(header: Text("Personal Information")) {
                Text("Name: John Doe")
                Text("Email: john.doe@example.com")
                Text("Date of Birth: January 1, 1980")
            }
            
            Section(header: Text("Contact Information")) {
                Text("Address: 123 Main St, City")
                Text("Phone: (123) 456-7890")
            }
            
            Section(header: Text("Request pray support")) {
                Button(action: shareProfile) {
                    Text("Request pray support")
                }
            }
                
                Section(header: Text("Notes")) {
                    Text("You haven't added any notes yet.")
                }
                
                Section(header: Text("Goals")) {
                    Text("You haven't set any goals yet.")
                }
                
                Section(header: Text("Prayer List")) {
                    Text("You haven't added any prayer requests yet.")
                }
            .listStyle(GroupedListStyle())
            .navigationBarTitle("My Profile")
        }
    }
    
    func shareProfile() {
        // Implement sharing logic here
    }
}

#Preview {
    PersonalInformationView()
}
