//
//  UserListViewModel.swift
//  UsersList
//
//  Created by Maria José Sánchez Cairazco on 13/09/24.
//

import SwiftUI
import Alamofire

class UserListViewModel: ObservableObject {
    @Published var users: [User] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    @Published var nameSort = SortBy.nameASC
    @Published var emailSort = SortBy.emailASC
    @Published var phoneSort = SortBy.phoneASC
    
    private let networkService: NetworkService
    
    init(networkService: NetworkService = NetworkService()) {
        self.networkService = networkService
    }
    
    func fetchUsers() {
        isLoading = true
        networkService.fetchUsers { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                
                switch result {
                case .success(let users):
                    self?.users = users
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
    }
    
    func sortList(by sortType: SortBy) {
        switch sortType {
        case .nameASC:
            users.sort {
                $0.name.lowercased() < $1.name.lowercased()
            }
        case .nameDESC:
            users.sort {
                $0.name.lowercased() > $1.name.lowercased()
            }
        case .emailASC:
            users.sort {
                $0.email.lowercased() < $1.email.lowercased()
            }
        case .emailDESC:
            users.sort {
                $0.email.lowercased() > $1.email.lowercased()
            }
        case .phoneASC:
            users.sort {
                $0.phone < $1.phone
            }
        case .phoneDESC:
            users.sort {
                $0.phone > $1.phone
            }
        }
    }
    
    enum SortBy: String {
        case nameASC = "Name △"
        case nameDESC = "Name ▽"
        case emailASC = "Email △"
        case emailDESC = "Email ▽"
        case phoneASC = "Phone △"
        case phoneDESC = "Phone ▽"
    }
}
