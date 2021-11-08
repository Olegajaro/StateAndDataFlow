//
//  StorageManager.swift
//  StateAndDataFlow
//
//  Created by Олег Федоров on 08.11.2021.
//

import Foundation

class StorageManager {
    
    static let shared = StorageManager()
    
    private let userDefaults = UserDefaults.standard
    private let key = "user_info"
    
    private init() {}
    
    func saveUser() {
        let user = getUser()
        if let encodedData = try? JSONEncoder().encode(user) {
            userDefaults.set(encodedData, forKey: key)
        }
    }
    
    func getUser() -> User {
        guard
            let data = userDefaults.data(forKey: key),
            let saveUser = try? JSONDecoder().decode(User.self, from: data)
        else { return User() }
        
        return saveUser
    }
    
    func clear(userManager: UserManager) {
        userManager.currentUser.name = ""
        userManager.currentUser.isRegister = false
    }
}
