//
//  MenuViewViewModelTest.swift
//  LittleLemonMenuTests
//
//  Created by Thais Aquino on 22/9/2023.
//

import XCTest
@testable import LittleLemonMenu

final class MenuViewViewModelTest: XCTestCase {

    func testViewModel_InitialState_setupCorrectly() throws {
        let sut = MenuViewViewModel(provider: DataProviderFake())
        
        XCTAssertTrue(sut.showFood)
        XCTAssertTrue(sut.showDrinks)
        XCTAssertTrue(sut.showDesserts)
        XCTAssertEqual(sut.sortBy, .fromAtoZ)
    }
    
    func testViewModel_ShowOnlyFood_setsCorrectly() throws {
        let sut = MenuViewViewModel(provider: DataProviderFake())
        
        sut.showFood = true
        sut.showDrinks = false
        sut.showDesserts = false
        
        sut.updateStates()
        
        XCTAssertTrue(sut.showFood)
        XCTAssertFalse(sut.showDrinks)
        XCTAssertFalse(sut.showDesserts)
        XCTAssertEqual(sut.sortBy, .fromAtoZ)
        
        XCTAssertTrue(sut.foodsToPresent.isEmpty == false)
        XCTAssertTrue(sut.drinksToPresent.isEmpty == true)
        XCTAssertTrue(sut.dessertsToPresent.isEmpty == true)
    }
    
    func testViewModel_ShowOnlyDrinks_setsCorrectly() throws {
        let sut = MenuViewViewModel(provider: DataProviderFake())
        
        sut.showFood = false
        sut.showDrinks = true
        sut.showDesserts = false
        
        sut.updateStates()
        
        XCTAssertFalse(sut.showFood)
        XCTAssertTrue(sut.showDrinks)
        XCTAssertFalse(sut.showDesserts)
        XCTAssertEqual(sut.sortBy, .fromAtoZ)
        
        XCTAssertTrue(sut.foodsToPresent.isEmpty == true)
        XCTAssertTrue(sut.drinksToPresent.isEmpty == false)
        XCTAssertTrue(sut.dessertsToPresent.isEmpty == true)
    }
    
    func testViewModel_ShowOnlyDesserts_setsCorrectly() throws {
        let sut = MenuViewViewModel(provider: DataProviderFake())
        
        sut.showFood = false
        sut.showDrinks = false
        sut.showDesserts = true
        
        sut.updateStates()
        
        XCTAssertFalse(sut.showFood)
        XCTAssertFalse(sut.showDrinks)
        XCTAssertTrue(sut.showDesserts)
        XCTAssertEqual(sut.sortBy, .fromAtoZ)
        
        XCTAssertTrue(sut.foodsToPresent.isEmpty == true)
        XCTAssertTrue(sut.drinksToPresent.isEmpty == true)
        XCTAssertTrue(sut.dessertsToPresent.isEmpty == false)
    }
}
