//
//  MenuItem.swift
//  LittleLemonMenu
//
//  Created by Thais Aquino on 21/9/2023.
//

import SwiftUI

struct MenuItemView: View {
    
    var menuItem: MenuItem
    
    init(menuItem: MenuItem) {
        self.menuItem = menuItem
    }
    
    var fakeImageView : some View {
        Rectangle().size(width: 110, height: 100)
    }
    
    var dishNameView: some View {
        Text(menuItem.title).font(.body).padding(EdgeInsets(top: 5, leading: 0, bottom: 0, trailing: 0)).lineLimit(1)
    }
    
    var body: some View {
        return NavigationLink(destination: MenuItemDetailsView(menuItem: menuItem)) {
            VStack(alignment: .center) {
                fakeImageView
                dishNameView
            }
            .frame(width: 110, height: 130)
        }.buttonStyle(PlainButtonStyle())
    }
}

struct MenuItem_Previews: PreviewProvider {
    static var previews: some View {
        MenuItemView(menuItem: MenuItem(price: 1, title: "s", category: .dessert, ordersCount: 3, ingredients: [.broccoli]))
    }
}
