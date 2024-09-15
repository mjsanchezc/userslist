//
//  UserView.swift
//  UsersList
//
//  Created by Maria José Sánchez Cairazco on 14/09/24.
//

import SwiftUI

struct UserView: View {
    let user: User
    
    var body: some View {
        HStack(alignment: .center) {
            UserInitialLetter(name: user.name)
                .aspectRatio(contentMode: .fill)
                .frame(alignment: .center)
                .accessibilityLabel(user.name)
            VStack(alignment: .leading) {
                Text(user.name)
                    .font(.headline)
                Text(user.email)
                    .font(.subheadline)
                Text(user.phone)
                    .font(.subheadline)
                Text("\(user.address.street), \(user.address.city)")
                    .font(.subheadline)
            }
        }
        .accessibilityElement(children: .contain)
        .accessibilityLabel(user.name)
    }
}
