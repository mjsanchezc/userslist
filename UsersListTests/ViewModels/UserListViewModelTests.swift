//
//  UserListViewModelTests.swift
//  UsersListTests
//
//  Created by Maria José Sánchez Cairazco on 14/09/24.
//

import XCTest
@testable import UsersList

class UserListViewModelTests: XCTestCase {
    func testFetchUsersSuccess() {
        let networkService = NetworkService()
        let viewModel = UserListViewModel(networkService: networkService)
        
        let expectation = XCTestExpectation(description: "Fetch users")
        viewModel.fetchUsers()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            XCTAssertEqual(viewModel.users.count, 10)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 2.0)
    }
}
