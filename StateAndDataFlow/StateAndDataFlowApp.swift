//
//  StateAndDataFlowApp.swift
//  StateAndDataFlow
//
//  Created by Олег Федоров on 02.11.2021.
//

import SwiftUI

@main
struct StateAndDataFlowApp: App {
    
    private let user = StorageManager.shared.getUser()
    
    var body: some Scene {
        WindowGroup {
            StarterView()
                .environmentObject(UserManager(currentUser: user))
        }
    }
}
