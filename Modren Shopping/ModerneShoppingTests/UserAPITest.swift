//
//  UserAPITest.swift
//  ModerneShoppingTests
//
//  Created by Hassan Yahya on 19/04/1443 AH.
//
import XCTest
@testable import ModerneShopping
class UserAPITest: XCTestCase {

    var mockUsers: MockAPIServices!
    var users: UserViewModel!
   
    
    override func setUp() {
        mockUsers = MockAPIServices()
        users = .init(userServices: mockUsers)
    }
    
    func testLoadingUser(){
    }
    
    override func tearDown() {

    }

}
