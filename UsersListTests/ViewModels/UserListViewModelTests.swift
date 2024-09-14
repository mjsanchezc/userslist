//
//  UserListViewModelTests.swift
//  UsersListTests
//
//  Created by Maria José Sánchez Cairazco on 14/09/24.
//

import XCTest
import Alamofire
@testable import UsersList

class UserListViewModelTests: XCTestCase {
    var viewModel: UserListViewModel!
    var mockNetworkService: MockNetworkService!
    
    override func setUp() {
        super.setUp()
        mockNetworkService = MockNetworkService()
        viewModel = UserListViewModel(networkService: mockNetworkService)
    }
    
    override func tearDown() {
        viewModel = nil
        mockNetworkService = nil
        super.tearDown()
    }
    
    // Test view model with full response
    func testFetchUsersSuccess() {
        let json = """
        [
            {
              "id": 1,
              "name": "Leanne Graham",
              "username": "Bret",
              "email": "Sincere@april.biz",
              "address": {
                "street": "Kulas Light",
                "suite": "Apt. 556",
                "city": "Gwenborough",
                "zipcode": "92998-3874",
                "geo": {
                  "lat": "-37.3159",
                  "lng": "81.1496"
                }
              }
            },
            {
              "id": 2,
              "name": "Ervin Howell",
              "email": "Shanna@melissa.tv",
              "address": {
                "street": "Victor Plains",
                "city": "Wisokyburgh",
                "zipcode": "90566-7771",
                "geo": {
                  "lat": "-43.9509",
                  "lng": "-34.4618"
                }
              }
            }
        ]
        """
        let jsonData = json.data(using: .utf8)!
        mockNetworkService.mockResponse = jsonData
        
        let expectation = XCTestExpectation(description: "Fetch users successfully")
        viewModel.fetchUsers()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            XCTAssertEqual(self.viewModel.users.count, 2)
            XCTAssertEqual(self.viewModel.users.first?.name, "Leanne Graham")
            XCTAssertFalse(self.viewModel.isLoading)
            XCTAssertNil(self.viewModel.errorMessage)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 2.0)
    }
    
    // Test view model response to an error from the network service
    func testFetchUserError() {
        mockNetworkService.shouldReturnError = true
        
        let expectation = XCTestExpectation(description: "Fetch users with error")
        viewModel.fetchUsers()
        
        let errorExpected = AFError.responseSerializationFailed(reason: .inputDataNilOrZeroLength)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            XCTAssertEqual(self.viewModel.users.count, 0)
            XCTAssertEqual(self.viewModel.errorMessage, errorExpected.errorDescription)
            XCTAssertFalse(self.viewModel.isLoading)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 2.0)
    }
    
    // Test view model loading state while fetching users
    func testLoadingDuringFetch() {
        let json = """
        [
            {
              "id": 1,
              "name": "Leanne Graham",
              "username": "Bret",
              "email": "Sincere@april.biz",
              "address": {
                "street": "Kulas Light",
                "suite": "Apt. 556",
                "city": "Gwenborough",
                "zipcode": "92998-3874",
                "geo": {
                  "lat": "-37.3159",
                  "lng": "81.1496"
                }
              }
            }
        ]
        """
        let jsonData = json.data(using: .utf8)!
        mockNetworkService.mockResponse = jsonData
        
        let expectation = XCTestExpectation(description: "Check loading state")
        viewModel.fetchUsers()
        
        XCTAssertTrue(viewModel.isLoading)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            XCTAssertFalse(self.viewModel.isLoading)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 2.0)
    }
}
