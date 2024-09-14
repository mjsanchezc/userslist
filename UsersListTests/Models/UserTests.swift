//
//  UserTests.swift
//  UsersListTests
//
//  Created by Maria José Sánchez Cairazco on 14/09/24.
//

import XCTest
@testable import UsersList

class UserTests: XCTestCase {
    // Test the model with full user data
    func testUserDecodingFull() {
        let json = """
        {
          "id": 1,
          "name": "Leanne Graham",
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
          },
        }
        """
        let jsonData = json.data(using: .utf8)!
        let user = try! JSONDecoder().decode(User.self, from: jsonData)

        XCTAssertEqual(user.id, 1)
        XCTAssertEqual(user.name, "Leanne Graham")
        XCTAssertEqual(user.address.street, "Kulas Light")
        XCTAssertEqual(user.address.geo.lat, "-37.3159")
    }
}
