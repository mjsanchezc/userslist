//
//  UserModel.swift
//  UsersList
//
//  Created by Maria José Sánchez Cairazco on 13/09/24.
//

struct User: Identifiable, Decodable, Hashable {
    let id: Int
    let name: String
    let email: String
    let address: Address
    let phone: String
    
    enum CodingKeys: String, CodingKey {
        case id, name, email, address, phone
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.email = try container.decode(String.self, forKey: .email)
        self.address = try container.decode(Address.self, forKey: .address)
        self.phone = try container.decode(String.self, forKey: .phone)
    }
    
    public func hash(into hasher: inout Hasher) {
        return hasher.combine(id)
    }
    
    static func == (lhs: User, rhs: User) -> Bool {
        return lhs.id == rhs.id
    }
}
