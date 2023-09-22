//
//  MenuItemSortTest.swift
//  LittleLemonMenuTests
//
//  Created by Thais Aquino on 22/9/2023.
//

import XCTest
@testable import LittleLemonMenu

final class MenuItemSortTest: XCTestCase {
    
    func testMenuItem_SortByAZ() throws {
        var sut: [MenuItem] = Array(Fixtures.foodItems)
        
        sut.applySort(sortOption: .fromAtoZ)
        XCTAssertEqual(sut[0].title, "Food_A")
        XCTAssertEqual(sut[1].title, "Food_B")
        XCTAssertEqual(sut[2].title, "Food_C")
    }
    
    func testMenuItem_SortByLowPrice() throws {
        var sut: [MenuItem] = Array(Fixtures.foodItems)
        
        sut.applySort(sortOption: .fromLowPrice)
        XCTAssertEqual(sut[0].title, "Food_C")
        XCTAssertEqual(sut[1].title, "Food_B")
        XCTAssertEqual(sut[2].title, "Food_A")
    }
    
    func testMenuItem_SortByMostPopular() throws {
        var sut: [MenuItem] = Array(Fixtures.foodItems)
        
        sut.applySort(sortOption: .mostPopular)
        XCTAssertEqual(sut[0].title, "Food_B")
        XCTAssertEqual(sut[1].title, "Food_A")
        XCTAssertEqual(sut[2].title, "Food_C")
    }
}
