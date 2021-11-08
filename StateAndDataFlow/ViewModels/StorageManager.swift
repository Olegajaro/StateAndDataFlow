//
//  StorageManager.swift
//  StateAndDataFlow
//
//  Created by Олег Федоров on 08.11.2021.
//

import SwiftUI

class StorageManager {
    
    static let shared = StorageManager()
    
    @AppStorage("user") private var userData: Data?
    
    private init() {}
    
    func save(user: User) {
        userData = try? JSONEncoder().encode(user)
    }
    
    func getUser() -> User {
        guard
            let user = try? JSONDecoder().decode(User.self, from: userData ?? Data())
        else { return User() }
        
        return user
    }
    
    func clear(userManager: UserManager) {
        userManager.currentUser.isRegister = false
        userManager.currentUser.name = ""
        userData = nil
    }
}
