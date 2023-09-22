//
//  MenuViewViewModel.swift
//  LittleLemonMenu
//
//  Created by Thais Aquino on 20/9/2023.
//

import Foundation

class MenuViewViewModel: ObservableObject {

    @Published var foods: [MenuItem] = []
    @Published var drinks: [MenuItem] = []
    @Published var desserts: [MenuItem] = []
    
    @Published var foodsToPresent: [MenuItem] = []
    @Published var drinksToPresent: [MenuItem] = []
    @Published var dessertsToPresent: [MenuItem] = []
    
    @Published var isFilterPresenting = false
    @Published var showDrinks = true
    @Published var showFood = true
    @Published var showDesserts = true
    
    @Published var sortBy = SortByOption.fromAtoZ
    
    init(provider: DataProviderProtocol) {
        foods = provider.foodsData
        drinks = provider.drinksData
        desserts = provider.dessertsData
    }
    
    func updateStates() {
        sortMenuItems()
        filterMenuItems()
    }
    
    func sortMenuItems() {
        foods.applySort(sortOption: sortBy)
        drinks.applySort(sortOption: sortBy)
        desserts.applySort(sortOption: sortBy)
    }
    
    func filterMenuItems() {
        foodsToPresent = showFood ? foods : []
        drinksToPresent = showDrinks ? drinks : []
        dessertsToPresent = showDesserts ? desserts : []
    }
}
