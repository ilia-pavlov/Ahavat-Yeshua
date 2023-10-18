//
//  UserSettings.swift
//  Ahavat Yeshua
//
//  Created by Ilia Pavlov on 9/21/23.
//

import Foundation

class UserSettings: ObservableObject {
    static let shared = UserSettings()
    
    @Published var name: String {
        didSet {
            UserDefaults.standard.set(name, forKey: "UserName")
        }
    }
    
    @Published var email: String {
        didSet {
            UserDefaults.standard.set(email, forKey: "UserEmail")
        }
    }
    
    @Published var birthDate: Date {
        didSet {
            UserDefaults.standard.set(birthDate, forKey: "UserBirthDate")
        }
    }
    
    @Published var address: String {
        didSet {
            UserDefaults.standard.set(address, forKey: "UserAddress")
        }
    }
    
    @Published var phone: String {
        didSet {
            UserDefaults.standard.set(phone, forKey: "UserPhone")
        }
    }
    
    private init() {
        self.name = UserDefaults.standard.string(forKey: "UserName") ?? ""
        self.email = UserDefaults.standard.string(forKey: "UserEmail") ?? ""
        self.birthDate = UserDefaults.standard.object(forKey: "UserBirthDate") as? Date ?? Date()
        self.address = UserDefaults.standard.string(forKey: "UserAddress") ?? ""
        self.phone = UserDefaults.standard.string(forKey: "UserPhone") ?? ""
    }
    
    func cleanAll() {
        self.name = ""
        self.email = ""
        self.address = ""
        self.phone = ""
    }
}

