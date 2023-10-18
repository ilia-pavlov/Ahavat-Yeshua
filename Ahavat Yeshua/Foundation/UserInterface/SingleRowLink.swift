//
//  SingleRowLink.swift
//  Ahavat Yeshua
//
//  Created by Ilia Pavlov on 9/21/23.
//

import SwiftUI

struct SingleRowLink: View {
    var image: String
    var label: String
    var url: String
    var lineLimit: Int?
    
    var body: some View {
        HStack {
            Image(systemName: image)
            Link(label, destination: URL(string: url)!)
                .lineLimit(lineLimit)
        }
    }
}

