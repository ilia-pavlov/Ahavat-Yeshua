//
//  ChurchInformationView.swift
//  Ahavat Yeshua
//
//  Created by Ilia Pavlov on 9/21/23.
//

import SwiftUI

struct ChurchInformationView: View {
    @State private var selectedTimeIndex = 0

    let content: ChurchInfoContext = .init()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            VStack {
                Text(content.aboutChurchText)
            }
            .padding()
            
            List {
                Section(header: Text(content.churchInformationTitle).font(.headline).foregroundColor(.gray)) {
                    SingleRowLink(image: "location.fill",
                                  label: content.churchAddress,
                                  url: content.churchGoogleMapsLocation,
                                  lineLimit: 2)
                    HStack {
                        Image(systemName: "clock")
                        
                        Picker(selection: $selectedTimeIndex, label: Text("")) {
                            ForEach(0..<content.timeOptions.count, id: \.self) { index in
                                Text(content.timeOptions[index])
                                    .tag(index)
                            }
                        }
                        .pickerStyle(MenuPickerStyle())
                    }
                    SingleRowLink(image: "video.fill",
                                  label: content.youtubeGreeting,
                                  url: content.liveStringURL)
                }
                                
                JoinUsView()
                ShareWithFriendsView()
            }
        }
        .navigationBarTitle("My Church")
    }
    
    func shareProfile() {
        // Implement sharing logic here
    }
}

struct ShareWithFriendsView: View {
    @State private var showingAlert = false

    var body: some View {
        Section(header: Text("Share with Friends").font(.headline).foregroundColor(.gray)) {
            VStack(spacing: 12) {
                // Share Church Information Button
                Button(action: shareChurchInformation) {
                    HStack {
                        Image(systemName: "house.fill") // Icon for church
                            .foregroundColor(.blue)
                        Text("Church Information")
                            .fontWeight(.bold)
                            .foregroundColor(.primary)
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue.opacity(0.1))
                    .cornerRadius(12)
                    .shadow(radius: 5)
                }
                .alert(isPresented: $showingAlert) {
                    Alert(title: Text("Shared!"), message: Text("Church Information shared successfully."), dismissButton: .default(Text("OK")))
                }

                // Share Personal Goals Button
                Button(action: sharePersonalGoals) {
                    HStack {
                        Image(systemName: "star.fill") // Icon for goals
                            .foregroundColor(.yellow)
                        Text("Personal Goals")
                            .fontWeight(.bold)
                            .foregroundColor(.primary)
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.green.opacity(0.1))
                    .cornerRadius(12)
                    .shadow(radius: 5)
                }
                .alert(isPresented: $showingAlert) {
                    Alert(title: Text("Shared!"), message: Text("Personal Goals shared successfully."), dismissButton: .default(Text("OK")))
                }
            }
        }
    }

    // Simulated function for sharing Church Information
    private func shareChurchInformation() {
        // Simulate share action
        showingAlert = true
    }

    // Simulated function for sharing Personal Goals
    private func sharePersonalGoals() {
        // Simulate share action
        showingAlert = true
    }
}

struct JoinUsView: View {
    @State private var showingAlert = false
    @State private var alertMessage = ""

    var body: some View {
        Section(header: Text("Join Us").font(.headline).foregroundColor(.gray)) {
            VStack(spacing: 12) {
                // Facebook Button
                Button(action: {
                    alertMessage = "You are now connected to Facebook."
                    showingAlert = true
                }) {
                    HStack {
                        Image(systemName: "link") // Icon for Facebook
                            .foregroundColor(.blue)
                        Text("Facebook")
                            .fontWeight(.bold)
                            .foregroundColor(.primary)
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue.opacity(0.1))
                    .cornerRadius(12)
                    .shadow(radius: 5)
                }
                .alert(isPresented: $showingAlert) {
                    Alert(title: Text("Joined!"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
                }

                // Instagram Button
                Button(action: {
                    alertMessage = "You are now connected to Instagram."
                    showingAlert = true
                }) {
                    HStack {
                        Image(systemName: "link") // Icon for Instagram
                            .foregroundColor(.blue)
                        Text("Instagram")
                            .fontWeight(.bold)
                            .foregroundColor(.primary)
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.purple.opacity(0.1))
                    .cornerRadius(12)
                    .shadow(radius: 5)
                }
                .alert(isPresented: $showingAlert) {
                    Alert(title: Text("Joined!"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
                }

                // WhatsApp Button
                Button(action: {
                    alertMessage = "You are now connected to WhatsApp."
                    showingAlert = true
                }) {
                    HStack {
                        Image(systemName: "link") // Icon for WhatsApp
                            .foregroundColor(.green)
                        Text("WhatsApp")
                            .fontWeight(.bold)
                            .foregroundColor(.primary)
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.green.opacity(0.1))
                    .cornerRadius(12)
                    .shadow(radius: 5)
                }
                .alert(isPresented: $showingAlert) {
                    Alert(title: Text("Joined!"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
                }

                // Email Button
                Button(action: {
                    alertMessage = "You are now connected to Email."
                    showingAlert = true
                }) {
                    HStack {
                        Image(systemName: "link") // Icon for Email
                            .foregroundColor(.red)
                        Text("Email")
                            .fontWeight(.bold)
                            .foregroundColor(.primary)
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.red.opacity(0.1))
                    .cornerRadius(12)
                    .shadow(radius: 5)
                }
                .alert(isPresented: $showingAlert) {
                    Alert(title: Text("Joined!"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
                }
            }
        }
    }
}




#Preview {
    ChurchInformationView()
}
