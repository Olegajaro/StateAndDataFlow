//
//  ContentView.swift
//  StateAndDataFlow
//
//  Created by Олег Федоров on 02.11.2021.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var timer = TimeCounter()
    @EnvironmentObject private var user: UserManager
    
    var body: some View {
        VStack {
            Text("Hi, \(user.currentUser.name)")
                .font(.largeTitle)
                .padding(.top, 100)
            
            Text("\(timer.counter)")
                .font(.largeTitle)
                .padding(.top, 100)
            
            VStack {
                ButtonView(title: timer.buttonTitle, color: .red) {
                    timer.startTimer()
                }
                
                Spacer()
                
                ButtonView(title: "LOG OUT", color: .blue) {
                    StorageManager.shared.clear(userManager: user)
                }
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(UserManager())
    }
}
