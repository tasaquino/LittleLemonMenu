//
//  DataProvider.swift
//  LittleLemonMenuTests
//
//  Created by Thais Aquino on 22/9/2023.
//

import Foundation
@testable import LittleLemonMenu

struct DataProviderFake: DataProviderProtocol {
    var foodsData: [MenuItem] = Array(Fixtures.foodItems)
    var drinksData: [MenuItem] = Array(Fixtures.drinks)
    var dessertsData: [MenuItem] = Array(Fixtures.desserts)
}
