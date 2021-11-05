//
//  RegisterView.swift
//  StateAndDataFlow
//
//  Created by Олег Федоров on 02.11.2021.
//

import SwiftUI

struct RegisterView: View {
    
    @State private var userName = ""
    @EnvironmentObject private var user: UserManager
    
    @FocusState private var isOnFocus: Bool
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                HStack {
                    TextField("Type your name...", text: $userName)
                        .multilineTextAlignment(.center)
                        .padding(.leading, 40)
                    Text("\(userName.count)")
                        .foregroundColor(userName.count > 2 ? .green : .red)
                        .padding(.trailing, 10)
                }
                .focused($isOnFocus)
                
                Button(action: { user.addUser(name: userName) }) {
                    Image(systemName: "checkmark.circle")
                    Text("OK")
                }
                .foregroundColor(userName.count > 2 ? .blue : Color(white: 0.75))
            }
            .padding()
            .padding(.top, -75)
        }
        .onTapGesture {
            isOnFocus = false
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
