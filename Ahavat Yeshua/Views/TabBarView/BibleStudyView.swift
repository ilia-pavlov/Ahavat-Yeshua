//
//  BibleStudyView.swift
//  Ahavat Yeshua
//
//  Created by Ilia Pavlov on 9/20/23.
//

import SwiftUI

struct BibleStudyView: View {
    var body: some View {
        VStack {
            Text("Faith and Knowledge")
                .font(.largeTitle)
            List {
                Section(header: Text("Old Testament")) {
                    HStack {
                        Image(systemName: "video.fill")
                            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                        Link("Book of Malachi", destination: URL(string: "https://www.youtube.com/watch?v=zVLKnHs5nFY&list=PLqF5Pt_yMO7lcUN6hHO1udbYfAXaeDdJc")!)
                    }
                    HStack {
                        Image(systemName: "video.fill")
                            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                        Link("Book of Daniel", destination: URL(string: "https://www.youtube.com/watch?v=7gM0bgin0O0&list=PLqF5Pt_yMO7lYb0Sym42iT42cdevaFwFx")!)
                    }
                    HStack {
                        Image(systemName: "video.fill")
                            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                        Link("Book of Isaiah", destination: URL(string: "https://www.youtube.com/watch?v=6_2IqOlbfhU&list=PLqF5Pt_yMO7mdHHR3PWx7EN60Or7MNYPi")!)
                    }
                }
                Section(header: Text("New Testament")) {
                    Text("1 Peter")
                    Text("Acts")
                    Text("Galatians")
                }
            }
        }
    }
}

#Preview {
    BibleStudyView()
}
