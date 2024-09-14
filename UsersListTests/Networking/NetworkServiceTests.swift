//
//  NetworkServiceTests.swift
//  UsersListTests
//
//  Created by Maria José Sánchez Cairazco on 14/09/24.
//

import XCTest
import Alamofire
@testable import UsersList

class NetworkServiceTests: XCTestCase {
    func testFetchUsersSuccess() {
        let networkService = NetworkService()

        let expectation = XCTestExpectation(description: "Fetch users")
        networkService.fetchUsers { result in
            switch result {
            case .success(let users):
                XCTAssertEqual(users.count, 10)
                expectation.fulfill()
            case .failure(let error):
                XCTFail("Expected success but got failure: \(error)")
            }
        }

        wait(for: [expectation], timeout: 2.0)
    }
}
