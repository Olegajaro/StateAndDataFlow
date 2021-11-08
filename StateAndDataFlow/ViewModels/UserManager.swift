//
//  UserManager.swift
//  StateAndDataFlow
//
//  Created by Олег Федоров on 02.11.2021.
//

import Combine

final class UserManager: ObservableObject {
    
    @Published var currentUser = User()
    
    var nameIsValid: Bool {
        currentUser.name.count > 2
    }
    
    init() {}
    
    init(currentUser: User) {
        self.currentUser = currentUser
    }
//    func addUser(name: String) {
//        if nameIsValid {
//            currentUser.name = name
//            currentUser.isRegister.toggle()
//        }
//    }
//
//    func deleteUser() {
//        currentUser.name = ""
//        currentUser.isRegister = false
//    }
//
//    private func getUser() {
//        guard
//            let data = userDefaults.data(forKey: key),
//            let saveUser = try? JSONDecoder().decode(User.self, from: data)
//        else { return }
//
//        currentUser = saveUser
//    }
//
//    private func saveUser() {
//        if let encodedData = try? JSONEncoder().encode(currentUser) {
//            userDefaults.set(encodedData, forKey: key)
//        }
//    }
}
