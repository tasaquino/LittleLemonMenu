//
//  MenuCategoryView.swift
//  LittleLemonMenu
//
//  Created by Thais Aquino on 21/9/2023.
//

import SwiftUI

struct MenuCategoryView: View {
    
    var category: MenuCategory
    var menuItems: [MenuItem]
    
    init(category: MenuCategory, menuItems: [MenuItem]) {
        self.category = category
        self.menuItems = menuItems
    }
    
    var columnsConfig: [GridItem] {
        [
            GridItem(.adaptive(minimum: 100)),
            GridItem(.adaptive(minimum: 100)),
            GridItem(.adaptive(minimum: 100))
        ]
    }
    
    var categoryTitlePadding = EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 0)
    var categoryTitle: some View {
        HStack {
            Text(category.rawValue).bold()
                .font(Font.headline)
                .padding(categoryTitlePadding)
            Spacer()
        }
    }
    
    var categoryGridView: some View {
        LazyVGrid(columns: columnsConfig) {
            ForEach(menuItems, id: \.id) { menuItem in
                MenuItemView(menuItem: menuItem)
            }
        }
    }
    
    var categoryViewPadding = EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16)
    var body: some View {
        VStack(alignment: .center) {
            categoryTitle
            categoryGridView
        }.padding(categoryViewPadding)
    }
}

struct MenuCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        MenuCategoryView(category: MenuCategory.food, menuItems: [MenuItem(price: 1, title: "s", category: .dessert, ordersCount: 3, ingredients: [.broccoli])])
    }
}
