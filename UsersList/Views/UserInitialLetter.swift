//
//  UserInitialLetter.swift
//  UsersList
//
//  Created by Maria José Sánchez Cairazco on 14/09/24.
//

import SwiftUI

struct UserInitialLetter: View {
    let name: String
    
    var initial: String {
        return String(name.prefix(1)).uppercased()
    }
    
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.blue)
                .frame(width: 55, height: 55)
            
            Text(initial)
                .font(.largeTitle)
                .foregroundColor(.white)
                .bold()
        }
    }
}
