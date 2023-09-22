//
//  MenuItemsView.swift
//  LittleLemonMenu
//
//  Created by Thais Aquino on 20/9/2023.
//

import SwiftUI

struct MenuItemsView: View {
    @StateObject private var viewModel = MenuViewViewModel(provider: DataProvider())
    
    var menuOptions : some View {
        ScrollView {
            if viewModel.showFood {
                MenuCategoryView(category: .food, menuItems: viewModel.foods)
            }
            if viewModel.showDrinks {
                MenuCategoryView(category: .drink, menuItems: viewModel.drinks)
            }
            if viewModel.showDesserts {
                MenuCategoryView(category: .dessert, menuItems: viewModel.desserts)
            }
        }
    }
    
    var filterAndSortView : some View {
        MenuItemsOptionView(
            delegate: self,
            showFood: viewModel.showFood,
            showDrinks: viewModel.showDrinks,
            showDesserts: viewModel.showDesserts,
            sortBy: viewModel.sortBy
        ).accessibilityLabel("filterAndSortView")
    }
    
    var body: some View {
        NavigationStack {
            menuOptions.navigationTitle("Menu")
                .toolbar {
                    Button {
                        viewModel.isFilterPresenting.toggle()
                    } label: {
                        Image(systemName: "slider.horizontal.3")
                    } .accessibilityLabel("filterAndSortButton")
                        .sheet(isPresented: $viewModel.isFilterPresenting) {
                        filterAndSortView
                        .presentationDetents([.large])
                        .presentationDragIndicator(.hidden)
                    }
                }
        }.onAppear {
            viewModel.updateStates()
        }
    }
}

extension MenuItemsView: MenuItemsOptionsDelegate {
    func applyFilterAndSortOptions(showFood: Bool, showDrinks: Bool, showDesserts: Bool, sortBy: SortByOption) {
        viewModel.showFood = showFood
        viewModel.showDrinks = showDrinks
        viewModel.showDesserts = showDesserts
        viewModel.sortBy = sortBy
        
        viewModel.updateStates()
        
        viewModel.isFilterPresenting.toggle()
    }
}

struct MenuItemsView_Previews: PreviewProvider {
    static var previews: some View {
        MenuItemsView()
    }
}


