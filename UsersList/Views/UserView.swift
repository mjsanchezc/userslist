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
        HStack(alignment: .top) {
            UserInitialLetter(name: user.name)
                .aspectRatio(contentMode: .fill)
                .frame(alignment: .center)
                .accessibilityLabel(user.name)
            VStack(alignment: .leading) {
                Text(user.name)
                    .font(.headline)
                Spacer()
                Text("Contact")
                    .font(.subheadline)
                    .bold()
                Text(user.email)
                    .font(.subheadline)
                Text(user.phone)
                    .font(.subheadline)
                Spacer()
                Text("Address")
                    .font(.subheadline)
                    .bold()
                Text(user.address.street)
                    .font(.subheadline)
                if let suite = user.address.suite {
                    Text(suite)
                        .font(.subheadline)
                }
                Text(user.address.city)
                    .font(.subheadline)
                if let zipcode = user.address.zipcode {
                    Text(zipcode)
                        .font(.subheadline)
                }
            }
        }
        .accessibilityElement(children: .contain)
        .accessibilityLabel(user.name)
    }
}
