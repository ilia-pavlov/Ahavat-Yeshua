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
                Section(header: Text(content.churchInformationTitle)) {
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
                
                Section(header: Text("Share with Friends")) {
                    Button(action: shareProfile) {
                        Text("Church information")
                    }
                    Button(action: shareProfile) {
                        Text("Personal Goals")
                    }
                }
                
                Section(header: Text("Join Us")) {
                    SingleRow(image: "link", text: "FaceBook")
                    SingleRow(image: "link", text: "Instagram")
                    SingleRow(image: "link", text: "WhatsApp")
                    SingleRow(image: "link", text: "Email")
                }
            }
        }
        .navigationBarTitle("My Church")
    }
    
    func shareProfile() {
        // Implement sharing logic here
    }
}

#Preview {
    ChurchInformationView()
}
