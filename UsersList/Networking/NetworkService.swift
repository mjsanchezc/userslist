//
//  NetworkService.swift
//  UsersList
//
//  Created by Maria José Sánchez Cairazco on 13/09/24.
//

import Alamofire

class NetworkService {
    func fetchUsers(currentPage: Int, pageSize: Int, completion: @escaping (Result<[User], AFError>) -> Void) {
        let params: [String: Any] = ["_page": currentPage, "_limit": pageSize]
        
        AF.request(Constants.userURL, parameters: params).responseDecodable(of: [User].self) { response in
            DispatchQueue.main.async {
                switch response.result {
                case .success(let users):
                    completion(.success(users))
                
                case .failure(let error):
                    completion(.failure(error))
                }
            }
            
        }
    }
}
