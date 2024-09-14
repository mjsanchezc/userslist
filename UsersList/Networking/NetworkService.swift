//
//  NetworkService.swift
//  UsersList
//
//  Created by Maria José Sánchez Cairazco on 13/09/24.
//

import Alamofire

class NetworkService {
    func fetchUsers(completion: @escaping (Result<[User], AFError>) -> Void) {
        AF.request(Constants.userURL).responseDecodable(of: [User].self) { response in
            switch response.result {
            case .success(let users):
                completion(.success(users))
            
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
