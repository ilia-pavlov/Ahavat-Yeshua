//
//  ProfileMainView.swift
//  Ahavat Yeshua
//
//  Created by Ilia Pavlov on 4/18/25.
//

import SwiftUI
import PhotosUI

struct ProfileMainView: View {
    @State private var selectedItem: PhotosPickerItem?
    @State private var profileImage: Image = Image(systemName: "person.crop.circle.fill")
    @State private var profileUIImage: UIImage?

    var name: String = "Michaela"
    var nickname: String = "#blessed"
    var accomplishments: String = "12 Studies"
    var friendsCount: Int = 8
    var ministryLabel: String = "3 Ministries"

    var body: some View {
        VStack(spacing: 20) {
            // Profile Image + Picker
            PhotosPicker(selection: $selectedItem, matching: .images) {
                profileImage
                    .resizable()
                    .scaledToFill()
                    .frame(width: 220, height: 220)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 4))
                    .shadow(radius: 10)
                    .padding(.top)
            }
            .onChange(of: selectedItem) { newItem in
                Task {
                    if let data = try? await newItem?.loadTransferable(type: Data.self),
                       let uiImage = UIImage(data: data) {
                        profileUIImage = uiImage
                        profileImage = Image(uiImage: uiImage)
                    }
                }
            }

            // Name & Nickname
            VStack(spacing: 4) {
                Text(name)
                    .font(.title)
                    .fontWeight(.bold)
                Text(nickname)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Divider()
                .padding(.horizontal)

            // Chips Section
            HStack(spacing: 12) {
                profileChip(value: accomplishments, icon: "book.fill", color: .blue)
                profileChip(value: "\(friendsCount)", icon: "person.2.fill", color: .green)
                profileChip(value: ministryLabel, icon: "hands.sparkles.fill", color: .purple)
            }
            .padding(.bottom)
        }
        .frame(maxWidth: .infinity)
        .padding()
        
        HStack {
            NavigationLink(destination: PersonalInformationView()) {
                SquareView(iconName: "person", label: "Personal", foregroundColor: .gray)
            }
            NavigationLink(destination: ChurchInformationView()) {
                SquareView(iconName: "cross", label: "Church", foregroundColor: .gray)
            }
        }
        Spacer()
        .navigationTitle("Profile")
    }

    // Simplified chip view
    private func profileChip(value: String, icon: String, color: Color) -> some View {
        Label(value, systemImage: icon)
            .font(.subheadline)
            .foregroundColor(.white)
            .padding(.horizontal, 12)
            .padding(.vertical, 8)
            .background(color.opacity(0.85))
            .clipShape(Capsule())
    }
}


#Preview {
    ProfileMainView()
}

