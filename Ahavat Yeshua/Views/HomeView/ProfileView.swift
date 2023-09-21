//
//  ProfileView.swift
//  Ahavat Yeshua
//
//  Created by Ilia Pavlov on 9/20/23.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
            List {
                NavigationLink(destination: PersonalInformationView()) {
                    Image(systemName: "person")
                    Text("Personal")
                }
                NavigationLink(destination: ChurchInformationView()) {
                    Image(systemName: "cross")
                    Text("Church")
                }
            }
            .navigationTitle("Profile")
    }
}

#Preview {
    ProfileView()
}
