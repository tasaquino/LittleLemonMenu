//
//  MenuItemsOptionView.swift
//  LittleLemonMenu
//
//  Created by Thais Aquino on 21/9/2023.
//

import SwiftUI

protocol MenuItemsOptionsDelegate {
    func applyFilterAndSortOptions(showFood: Bool, showDrinks: Bool, showDesserts: Bool, sortBy: SortByOption) -> Void
}

struct MenuItemsOptionView: View {
    var delegate: MenuItemsOptionsDelegate
    @State var showFood: Bool
    @State var showDrinks: Bool
    @State var showDesserts: Bool
    @State var sortBy: SortByOption
    
    init(delegate: MenuItemsOptionsDelegate, showFood: Bool, showDrinks: Bool, showDesserts: Bool, sortBy: SortByOption) {
        self.delegate = delegate
        _showFood = State(initialValue: showFood)
        _showDrinks = State(initialValue: showDrinks)
        _showDesserts = State(initialValue: showDesserts)
        _sortBy = State(initialValue: sortBy)
    }
    
    var doneButtonView: some View {
        HStack {
            Spacer()
            Button("Done") {
                delegate.applyFilterAndSortOptions(showFood: showFood, showDrinks: showDrinks, showDesserts: showDesserts, sortBy: sortBy)
            }
        }.padding(EdgeInsets(top: 16, leading: 0, bottom: 0, trailing: 16))
    }
    
    var body: some View {
        VStack {
            doneButtonView
            FilterTitleView()
            List {
                Section("SELECTED CATEGORIES") {
                    Toggle(MenuCategory.food.rawValue, isOn: $showFood)
                    Toggle(MenuCategory.drink.rawValue, isOn: $showDrinks)
                    Toggle(MenuCategory.dessert.rawValue, isOn: $showDesserts)
                }
                Picker("SORTED BY", selection: $sortBy) {
                    ForEach(SortByOption.allCases, id: \.self) { category in
                        Text(category.rawValue).tag(category)
                    }
                }
            }
        }.background(Color(UIColor.systemGroupedBackground))
    }
    
    private struct FilterTitleView: View {
        var body: some View {
            HStack {
                Text("Filter").bold().font(.largeTitle)
                Spacer()
            }.padding(EdgeInsets(top: 10, leading: 16, bottom: 0, trailing: 0))
        }
    }
}
