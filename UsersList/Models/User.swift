//
//  UserModel.swift
//  UsersList
//
//  Created by Maria José Sánchez Cairazco on 13/09/24.
//

import Foundation

struct User: Identifiable, Decodable {
    let id: Int
    let name: String
    let email: String
    let address: Address
    
    enum CodingKeys: String, CodingKey {
        case id, name, email, address
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.email = try container.decode(String.self, forKey: .email)
        self.address = try container.decode(Address.self, forKey: .address)
    }
}
