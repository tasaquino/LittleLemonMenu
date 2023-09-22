//
//  MenuItemTest.swift
//  LittleLemonMenuTests
//
//  Created by Thais Aquino on 22/9/2023.
//

import XCTest
@testable import LittleLemonMenu

final class MenuItemTest: XCTestCase {

    func testMenuItemTitle() throws {
        let title = "SomeTitle"
        
        let sut = MenuItem(price: 1.0, title: title, category: .food, ordersCount: 1, ingredients: [.spinach, .broccoli, .carrot, .pasta])
        
        XCTAssertEqual(sut.title, title)
    }
    
    func testMenuItemIngredients() throws {
        let title = "SomeTitle"
        
        let sut = MenuItem(price: 1.0, title: title, category: .food, ordersCount: 1, ingredients: [.spinach, .broccoli, .carrot, .pasta])
        
        XCTAssertEqual(sut.ingredients, [.spinach, .broccoli, .carrot, .pasta])
    }
    
    func testMenuItemFields() throws {
        let title = "SomeTitle"
        
        let sut = MenuItem(price: 1.0, title: title, category: .food, ordersCount: 1, ingredients: [.spinach, .broccoli, .carrot, .pasta])
        
        XCTAssertEqual(sut.title, title)
        XCTAssertNotNil(sut.id)
        XCTAssertEqual(sut.category, .food)
        XCTAssertEqual(sut.ordersCount, 1)
        XCTAssertEqual(sut.ingredients, [.spinach, .broccoli, .carrot, .pasta])
    }
}
