//
//  DataProvider.swift
//  LittleLemonMenu
//
//  Created by Thais Aquino on 22/9/2023.
//

import Foundation

protocol DataProviderProtocol {
    var foodsData: [MenuItem] { get set }
    var drinksData: [MenuItem] { get set }
    var dessertsData: [MenuItem] { get set }
}

struct DataProvider: DataProviderProtocol {
    static let foodRange = 1...12
    static let drinksRange = 1...8
    static let dessertsRange = 1...4
    
    var foodsData: [MenuItem] = (foodRange).map { number in
        MenuItem(
            price: Double.random(in: 1...15),
            title: "Food_\(number)",
            category: .food,
            ordersCount: Int.random(in: 1...10),
            ingredients: [
                Ingredient.allCases.randomElement() ?? Ingredient.broccoli,
                Ingredient.allCases.randomElement() ?? Ingredient.broccoli,
                Ingredient.allCases.randomElement() ?? Ingredient.broccoli,
                Ingredient.allCases.randomElement() ?? Ingredient.broccoli,
                Ingredient.allCases.randomElement() ?? Ingredient.broccoli,
            ])
    }
    
    var drinksData: [MenuItem] = (drinksRange).map { number in
        MenuItem(
            price: Double.random(in: 1...8),
            title: "Drink_\(number)",
            category: .drink,
            ordersCount: Int.random(in: 1...10),
            ingredients: [])
    }
    
    var dessertsData: [MenuItem] =  (dessertsRange).map { number in
        MenuItem(
            price: Double.random(in: 1...8),
            title: "Dessert_\(number)",
            category: .dessert,
            ordersCount: Int.random(in: 1...5),
            ingredients: [])
    }
}
