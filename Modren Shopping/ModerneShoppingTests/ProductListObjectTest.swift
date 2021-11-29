//
//  ProductViewModelTests.swift
//  ModerneShoppingTests
//
//  Created by Hassan Yahya on 19/04/1443 AH.
//
import XCTest
@testable import ModerneShopping

class ProductListObjectTest: XCTestCase {
    var mockProductListObject: MockAPIServices!
    var product: ProductsListObject!
   
    
    override func setUp() {
        mockProductListObject = MockAPIServices()
        product = .init(productServices: mockProductListObject)
    }
    
    func testLoadingTwentyProducts(){
        product.products = Product.sampleProducts
        XCTAssert(product.products != nil)
    }
    
    override func tearDown() {

    }
}
