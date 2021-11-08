//
//  RegisterView.swift
//  StateAndDataFlow
//
//  Created by Олег Федоров on 02.11.2021.
//

import SwiftUI

struct RegisterView: View {
    
    @EnvironmentObject private var userManager: UserManager
    
    @FocusState private var isOnFocus: Bool
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                UserNameTF(
                    name: $userManager.currentUser.name,
                    nameIsValid: userManager.nameIsValid
                )
                    .focused($isOnFocus)
                
                Button(action: registerUser) {
                    Image(systemName: "checkmark.circle")
                    Text("OK")
                }
                .disabled(!userManager.nameIsValid)
            }
            .padding(EdgeInsets(top: -75,
                                leading: 16,
                                bottom: 16,
                                trailing: 16))

        }
        .onTapGesture {
            isOnFocus = false
        }
    }
}

extension RegisterView {
    func registerUser() {
        if !userManager.currentUser.name.isEmpty {
            userManager.currentUser.isRegister.toggle()
            StorageManager.shared.save(user: userManager.currentUser)
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
            .environmentObject(UserManager())
    }
}

struct UserNameTF: View {
    
    @Binding var name: String
    var nameIsValid = false
    
    var body: some View {
        ZStack {
            TextField("Type your name...", text: $name)
                .multilineTextAlignment(.center)
            
            HStack{
                Spacer()
                Text("\(name.count)")
                    .foregroundColor(nameIsValid ? .green : .red)
                    .padding([.top, .trailing])
            }
            .padding(.bottom)
        }
    }
}
