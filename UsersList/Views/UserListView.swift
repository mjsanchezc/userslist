//
//  UserListView.swift
//  UsersList
//
//  Created by Maria José Sánchez Cairazco on 13/09/24.
//

import SwiftUI

struct UserListView: View {
    @ObservedObject var viewModel: UserListViewModel
    @State var inputText = ""
    
    var body: some View {
        VStack {
            SortAndSearchBarView(inputText: $inputText)
                .environmentObject(viewModel)
                .padding(.bottom, 5)
                .overlay(Divider()
                            .frame(width: UIScreen.main.bounds.width)
                            .background(Color.black), alignment: .bottom)
                .padding(.bottom, 5)
            
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading) {
                    ForEach(viewModel.users.filter({ user in
                        filterSearchText(user)
                    }), id: \.self) { user in
                        UserView(user: user)
                    }
                }
            }
            .onAppear {
                viewModel.fetchUsers()
            }
        }
    }
    
    private func filterSearchText(_ user: User) -> Bool {
        if inputText == "" || user.name.localizedCaseInsensitiveContains(inputText) {
            return true
        } else {
            return false
        }
    }
}

#Preview {
    UserListView(viewModel: UserListViewModel())
}
