//
//  MockNetworkService.swift
//  UsersListTests
//
//  Created by Maria José Sánchez Cairazco on 14/09/24.
//

import Alamofire
@testable import UsersList

class MockNetworkService: NetworkService {
    var mockResponse: Data?
    var shouldReturnError: Bool = false
    
    override func fetchUsers(completion: @escaping (Result<[User], AFError>) -> Void) {
        if shouldReturnError {
            let error = AFError.responseSerializationFailed(reason: .inputDataNilOrZeroLength)
            completion(.failure(error))
        } else if let mockResponse = mockResponse {
            do {
                let users = try JSONDecoder().decode([User].self, from: mockResponse)
                completion(.success(users))
            } catch {
                let error = AFError.responseSerializationFailed(reason: .inputFileNil)
                completion(.failure(error))
            }
        } else {
            // Simulate an empty response when there's no mockResponse
            completion(.success([]))
        }
    }
}

