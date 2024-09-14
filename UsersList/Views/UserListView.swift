//
//  UserListView.swift
//  UsersList
//
//  Created by Maria José Sánchez Cairazco on 13/09/24.
//

import SwiftUI

struct UserListView: View {
    @ObservedObject var viewModel: UserListViewModel
    
    var body: some View {
        NavigationView {
            List(viewModel.users) { user in
                HStack(alignment: .top) {
                    UserInitialLetter(name: user.name)
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 55, height: 55, alignment: .center)
                        .accessibilityLabel(user.name)
                    VStack(alignment: .leading) {
                        Text(user.name)
                            .font(.headline)
                        Text(user.email)
                            .font(.subheadline)
                        Text("\(user.address.street), \(user.address.city)")
                            .font(.subheadline)
                    }
                }
                .accessibilityElement(children: .contain)
                .accessibilityLabel(user.name)
            }
            .navigationTitle("Users")
            .onAppear {
                viewModel.fetchUsers()
            }
        }
    }
}

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

#Preview {
    UserListView(viewModel: UserListViewModel())
}
