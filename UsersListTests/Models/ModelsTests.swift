//
//  ModelsTests.swift
//  UsersListTests
//
//  Created by Maria José Sánchez Cairazco on 14/09/24.
//

import XCTest
@testable import UsersList

class UserTests: XCTestCase {
    // Test User and Address models with full user data
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
          "phone": "1-770-736-8031 x56442"
        }
        """
        let jsonData = json.data(using: .utf8)!
        let user = try! JSONDecoder().decode(User.self, from: jsonData)

        XCTAssertEqual(user.id, 1)
        XCTAssertEqual(user.name, "Leanne Graham")
        XCTAssertEqual(user.address.street, "Kulas Light")
        XCTAssertEqual(user.address.geo.lat, "-37.3159")
    }
    
    // Test User and Address models with optional data
    func testUserDecodingOptional() {
        let json = """
        {
          "id": 2,
          "name": "Ervin Howell",
          "email": "Shanna@melissa.tv",
          "address": {
            "street": "Victor Plains",
            "suite": null,
            "city": "Wisokyburgh",
            "geo": {
              "lat": "-43.9509",
              "lng": "-34.4618"
            }
          },
          "phone": "010-692-6593 x09125"
        }
        """
        let jsonData = json.data(using: .utf8)!
        let user = try! JSONDecoder().decode(User.self, from: jsonData)

        XCTAssertEqual(user.id, 2)
        XCTAssertEqual(user.name, "Ervin Howell")
        XCTAssertNil(user.address.zipcode)
        XCTAssertEqual(user.address.suite, nil)
        XCTAssertEqual(user.address.city, "Wisokyburgh")
    }
    
    // Test User and Address models with missing required fields
    func testUserDecodingMissingRequired() {
        let json = """
        {
          "id": 3,
          "name": "Clementine Bauch",
          "address": {
            "street": "Douglas Extension",
            "suite": "Suite 847",
            "city": "McKenziehaven",
            "zipcode": "59590-4157",
            "geo": {
              "lat": "-68.6102",
              "lng": "-47.0653"
            }
          }
        }
        """
        let jsonData = json.data(using: .utf8)
        
        XCTAssertThrowsError(try JSONDecoder().decode(User.self, from: jsonData!)) { error in
            XCTAssertTrue(error is DecodingError)
        }
    }
    
    // Test the Address model individually
    func testAddressDecoding() {
        let json = """
        {
          "street": "Kulas Light",
          "suite": "Apt. 556",
          "city": "Gwenborough",
          "zipcode": "92998-3874",
          "geo": {
            "lat": "-37.3159",
            "lng": "81.1496"
          }
        }
        """
        let jsonData = json.data(using: .utf8)!
        let address = try! JSONDecoder().decode(Address.self, from: jsonData)

        XCTAssertEqual(address.street, "Kulas Light")
        XCTAssertEqual(address.suite, "Apt. 556")
        XCTAssertEqual(address.city, "Gwenborough")
        XCTAssertEqual(address.zipcode, "92998-3874")
    }
    
    // Test the Geo model with invalid latitude/longitude
    func testGeoDecodingWithInvalidLatLong() {
        let json = """
        {
          "lat": null,
          "lng": "81.1496"
        }
        """
        let jsonData = json.data(using: .utf8)

        XCTAssertThrowsError(try JSONDecoder().decode(Geo.self, from: jsonData!)) { error in
            XCTAssertTrue(error is DecodingError)
        }
    }
}
