//
//  Address.swift
//  UsersList
//
//  Created by Maria José Sánchez Cairazco on 14/09/24.
//

import Foundation

struct Address: Codable {
    let street: String
    let suite: String?
    let city: String
    let zipcode: String?
    let geo: Geo
    
    enum CodingKeys: String, CodingKey {
        case street, suite, city, zipcode, geo
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.street = try container.decode(String.self, forKey: .street)
        self.suite = try? container.decode(String.self, forKey: .suite)
        self.city = try container.decode(String.self, forKey: .city)
        self.zipcode = try? container.decode(String.self, forKey: .zipcode)
        self.geo = try container.decode(Geo.self, forKey: .geo)
    }
}

struct Geo: Codable {
    let lat: String
    let lng: String
    
    enum CodingKeys: String, CodingKey {
        case lat, lng
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.lat = try container.decode(String.self, forKey: .lat)
        self.lng = try container.decode(String.self, forKey: .lng)
    }
}
