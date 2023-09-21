//
//  TabBarItem.swift
//  Ahavat Yeshua
//
//  Created by Ilia Pavlov on 9/20/23.
//

import SwiftUI

struct TabBarItem: View {
    var icon: SFSymbols
    
    var body: some View {
        VStack {
            Image(systemName: icon.key)
            Text(icon.value)
        }
    }
}
