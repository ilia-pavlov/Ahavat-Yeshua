//
//  EmailInputView.swift
//  Ahavat Yeshua
//
//  Created by Ilia Pavlov on 9/21/23.
//

import SwiftUI

struct EmailInputView: View {
    @Binding var email: String
    @State private var isValidEmail = true // Track email validation

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            TextField("Enter your email", text: $email)
                .autocapitalization(.none)
                .keyboardType(.emailAddress)
                .onChange(of: email) { newEmail in
                    isValidEmail = isValidEmailFormat(email: newEmail)
                }
                .cornerRadius(5)
            
            if !isValidEmail {
                Text("Please enter a valid email address.")
                    .foregroundColor(.red)
                    .font(.caption)
            }
        }
    }
    
    private func isValidEmailFormat(email: String) -> Bool {
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}")
        return emailPredicate.evaluate(with: email)
    }
}
