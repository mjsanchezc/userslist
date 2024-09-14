//
//  UsersListApp.swift
//  UsersList
//
//  Created by Maria José Sánchez Cairazco on 14/09/24.
//

import SwiftUI

@main
struct UsersListApp: App {
    var body: some Scene {
        WindowGroup {
            let networkService = NetworkService()
            let userListViewModel = UserListViewModel(networkService: networkService)
            
            UserListView(viewModel: userListViewModel)
        }
    }
}
