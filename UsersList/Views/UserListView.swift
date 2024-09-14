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
                Text(user.name)
            }
            .navigationTitle("Users")
            .onAppear {
                viewModel.fetchUsers()
            }
        }
    }
}
