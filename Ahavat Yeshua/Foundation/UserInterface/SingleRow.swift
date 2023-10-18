//
//  SingleRow.swift
//  Ahavat Yeshua
//
//  Created by Ilia Pavlov on 9/21/23.
//

import SwiftUI

struct SingleRow: View {
    var image: String
    var text: String
    
    var body: some View {
        HStack {
            Image(systemName: image)
            Text(text)
        }
    }
}

#Preview {
    SingleRow(image: "link", text: "Link")
}
