//
//  ChurchInformationView.swift
//  Ahavat Yeshua
//
//  Created by Ilia Pavlov on 9/21/23.
//

import SwiftUI

struct ChurchInformationView: View {
    @State private var selectedTimeIndex = 0
       let timeOptions = ["Saturday, 12–4 PM", "Sunday, Closed", "Monday, Closed", "Tuesday, Closed", "Wednesday, Closed", "Thursday, Closed", "Friday, Closed"]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            VStack {
                Text("Ahavat Yeshua - (Love of Jesus) is a messianic congregation in the heart of Astoria, NY.")
            }
            .padding()
            
            List {
                Section(header: Text("Church information")) {
                    HStack {
                        Image(systemName: "location.fill")
                        Link("92-14 63rd Dr, Queens, NY, US",
                             destination: URL(string: "https://www.google.com/maps/place/Ahavat+Yeshua+Fellowship/@40.7276836,-73.8661533,17z/data=!3m1!4b1!4m6!3m5!1s0x89c25f8d624b8b6f:0xb5d231b96e3dfd4e!8m2!3d40.7276836!4d-73.8635784!16s%2Fg%2F11q889xmws?entry=ttu")!)
                            .lineLimit(2)
                    }
                    
                    HStack {
                        Image(systemName: "clock")
                        
                        Picker(selection: $selectedTimeIndex, label: Text("")) {
                            ForEach(0..<timeOptions.count, id: \.self) { index in
                                Text(timeOptions[index])
                                    .tag(index)
                            }
                        }
                        .pickerStyle(MenuPickerStyle())
                    }
                    
                    HStack {
                        Image(systemName: "video.fill")
                        Link("Take a look our Youtube channel", destination: URL(string: "https://www.youtube.com/@AhavatYeshua/streams")!)
                    }
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
                    HStack {
                        Image(systemName: "link")
                        Text("FaceBook")
                    }
                    HStack {
                        Image(systemName: "link")
                        Text("Instagram")
                    }
                    HStack {
                        Image(systemName: "link")
                        Text("WhatsApp")
                    }
                    HStack {
                        Image(systemName: "link")
                        Text("Email")
                    }
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
