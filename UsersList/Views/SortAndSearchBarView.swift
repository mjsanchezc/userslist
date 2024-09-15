//
//  SortAndSearchBarView.swift
//  UsersList
//
//  Created by Maria José Sánchez Cairazco on 14/09/24.
//

import SwiftUI

struct SortAndSearchBarView: View {
    @EnvironmentObject var viewModel: UserListViewModel
    @State var showSearchBar = false
    @Binding var inputText: String
    
    var SearchBarView: some View {
        VStack {
            TextField("Search user...", text: $inputText)
                .padding(5)
                .font(.system(size: 15))
                .textFieldStyle(.roundedBorder)
                .shadow(radius: 3)
        }
    }
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "ellipsis")
                Spacer()
                
                if showSearchBar {
                    SearchBarView
                        .transition(.move(edge: .top))
                } else {
                    Text("Users")
                        .bold()
                }
                 
                Spacer()
                Image(systemName: "magnifyingglass")
                    .onTapGesture {
                        withAnimation(.easeInOut) {
                            showSearchBar.toggle()
                            inputText = ""
                        }
                    }
            }
            .font(.system(size: 25))
            .frame(height: 50)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .center, spacing: 10) {
                    Text(viewModel.nameSort.rawValue)
                        .padding(7)
                        .padding(.horizontal, 5)
                        .overlay(Capsule().stroke(.gray))
                        .onTapGesture {
                            if (viewModel.nameSort == .nameASC){
                                viewModel.nameSort = .nameDESC
                            } else {
                                viewModel.nameSort = .nameASC
                            }
                            viewModel.sortList(by: viewModel.nameSort)
                        }
                    Text(viewModel.emailSort.rawValue)
                        .padding(7)
                        .padding(.horizontal, 5)
                        .overlay(Capsule().stroke(.gray))
                        .onTapGesture {
                            if (viewModel.emailSort == .emailASC){
                                viewModel.emailSort = .emailDESC
                            } else {
                                viewModel.emailSort = .emailASC
                            }
                            viewModel.sortList(by: viewModel.emailSort)
                        }
                    Text(viewModel.phoneSort.rawValue)
                        .padding(7)
                        .padding(.horizontal, 5)
                        .overlay(Capsule().stroke(.gray))
                        .onTapGesture {
                            if (viewModel.phoneSort == .phoneASC){
                                viewModel.phoneSort = .phoneDESC
                            } else {
                                viewModel.phoneSort = .phoneASC
                            }
                            viewModel.sortList(by: viewModel.phoneSort)
                        }
                }
                .padding(.vertical, 3)
            }
        }
        .frame(width: UIScreen.main.bounds.width-30, height: 100)
    }
}
