//
//  MenuItem.swift
//  LittleLemonMenu
//
//  Created by Thais Aquino on 22/9/2023.
//

import Foundation

protocol MenuItemProtocol {
    var id : UUID { get }
    var price: Double { get }
    var title: String { get }
    var category: MenuCategory { get }
    var ordersCount: Int { get }
    var ingredients: [Ingredient] { get }
}

struct MenuItem: Identifiable, MenuItemProtocol {
    var id: UUID = UUID()
    var price: Double
    var title: String
    var category: MenuCategory
    var ordersCount: Int
    var ingredients: [Ingredient]
}

extension Array where Element == MenuItem {
    
    mutating func applySort(sortOption: SortByOption) {
        switch sortOption {
        case .fromAtoZ :
            self.sort { m1, m2 in
                m1.title < m2.title
            }
        case .mostPopular:
            self.sort { m1, m2 in
                m1.ordersCount > m2.ordersCount
            }
        case .fromLowPrice:
            self.sort { m1, m2 in
                m1.price < m2.price
            }
        }
    }
    
    mutating func sortByAZ() {
        self.sort { m1, m2 in
            m1.title < m2.title
        }
    }
    
    mutating func sortByMostPopular() {
        self.sort { m1, m2 in
            m1.ordersCount > m2.ordersCount
        }
    }
    
    mutating func sortByLowestPrice() {
        self.sort { m1, m2 in
            m1.price < m2.price
        }
    }
}
