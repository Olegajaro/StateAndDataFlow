//
//  LogOutButtonView.swift
//  StateAndDataFlow
//
//  Created by Олег Федоров on 03.11.2021.
//

import SwiftUI

struct LogOutButtonView: View {
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text("LOG OUT")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
        }
        .frame(width: 200, height: 60)
        .background(Color.blue)
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.black, lineWidth:  4)
        )
    }
}

struct LogOutButtonView_Previews: PreviewProvider {
    static var previews: some View {
        LogOutButtonView(action: {})
    }
}
