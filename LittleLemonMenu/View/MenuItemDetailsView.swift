//
//  MenuItemDetailsView.swift
//  LittleLemonMenu
//
//  Created by Thais Aquino on 20/9/2023.
//

import SwiftUI

struct MenuItemDetailsView: View {
    let menuItem: MenuItem
    init(menuItem: MenuItem) {
        self.menuItem = menuItem
    }
    
    var ingredients: Array<String> {
        menuItem.ingredients.map { $0.rawValue }
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center) {
                HStack(){
                    Text(menuItem.title).bold().font(.largeTitle)
                    Spacer()
                }
                LittleLemonLogo().padding(EdgeInsets(top: 0, leading: 60, bottom: 10, trailing: 60))
                InfoView(title: "Price", info: [String(String(format: "%.2f", menuItem.price))])
                InfoView(title: "Ordered", info: [String(menuItem.ordersCount)])
                InfoView(title: "Ingredients", info: ingredients)
            }.padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
        }
    }
    
    private struct InfoView: View {
        var title: String?
        var info: [String]?
        
        init(title: String, info: [String]) {
            self.title = title
            self.info = info
        }
        
        var infoTitle: String {
            self.title ?? ""
        }
        
        var infoData: [String] {
            self.info ?? []
        }
        
        var infoPadding: EdgeInsets {
            EdgeInsets(top: 1, leading: 0, bottom: 0, trailing: 0)
        }
        
        var body: some View {
            Text(infoTitle).bold().font(.body).padding(infoPadding)
            ForEach(infoData, id: \.self) { text in
                Text(text).font(.body)
            }
        }
    }
}

struct MenuItemDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        MenuItemDetailsView(menuItem: MenuItem(price: 1, title: "s", category: .dessert, ordersCount: 3, ingredients: [.broccoli]))
    }
}
