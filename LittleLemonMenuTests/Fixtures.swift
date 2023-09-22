//
//  Fixtures.swift
//  LittleLemonMenuTests
//
//  Created by Thais Aquino on 22/9/2023.
//

import Foundation
@testable import LittleLemonMenu

struct Fixtures {
    static let foodItems = [
        MenuItem(
            price: 10,
            title: "Food_A",
            category: .food,
            ordersCount: 2,
            ingredients: [
                Ingredient.broccoli,
                Ingredient.carrot
            ]),
        MenuItem(
            price: 3,
            title: "Food_B",
            category: .food,
            ordersCount: 3,
            ingredients: [
                Ingredient.pasta,
                Ingredient.spinach
            ]),
        MenuItem(
            price: 2,
            title: "Food_C",
            category: .food,
            ordersCount: 1,
            ingredients: [
                Ingredient.pasta,
                Ingredient.spinach
            ])
    ]
    
    static let drinks = [
        MenuItem(
            price: 10,
            title: "D1",
            category: .drink,
            ordersCount: 2,
            ingredients: []),
        MenuItem(
            price: 3,
            title: "D2",
            category: .drink,
            ordersCount: 3,
            ingredients: []),
        MenuItem(
            price: 2,
            title: "D3",
            category: .drink,
            ordersCount: 1,
            ingredients: [])
    ]
    
    static let desserts = [
        MenuItem(
            price: 10,
            title: "Dess1",
            category: .dessert,
            ordersCount: 2,
            ingredients: []),
        MenuItem(
            price: 3,
            title: "Dess2",
            category: .dessert,
            ordersCount: 3,
            ingredients: []),
        MenuItem(
            price: 2,
            title: "Dess3",
            category: .dessert,
            ordersCount: 1,
            ingredients: [])
    ]
}
