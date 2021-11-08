//
//  UserManager.swift
//  StateAndDataFlow
//
//  Created by Олег Федоров on 02.11.2021.
//

import Foundation

final class UserManager: ObservableObject {
    
    @Published var currentUser: User = User() {
        didSet{
            saveUser()
        }
    }
    
    private let userDefaults = UserDefaults.standard
    private let key = "user_info"
    
    init() {
        getUser()
    }
    
    func addUser(name: String) {
        if name.count > 2 {
            currentUser.name = name
            currentUser.isRegister.toggle()
        }
    }
    
    func deleteUser() {
        currentUser.name = ""
        currentUser.isRegister = false
    }
    
    private func getUser() {
        guard
            let data = userDefaults.data(forKey: key),
            let saveUser = try? JSONDecoder().decode(User.self, from: data)
        else { return }
        
        currentUser = saveUser
    }
    
    private func saveUser() {
        if let encodedData = try? JSONEncoder().encode(currentUser) {
            userDefaults.set(encodedData, forKey: key)
        }
    }
}
