//
//  ContentView.swift
//  Shared
//
//  Created by Gabriel Ferreira de Carvalho on 07/05/21.
//

import SwiftUI

struct ItemsTableView: View {
    
    @StateObject var viewModel = ItemsTableViewModel()
    @State var isShowingCreateView = false
    @State var isSHowingEditView = false
    @State var currentItem: Item?
    
    var body: some View {
        NavigationView {
            VStack {
                List(viewModel.items) { item in
                    ItemRow(item: item, action: {
                                currentItem = item
                                isSHowingEditView = true
                    })
                }
                
                NavigationLink(
                    destination: CreateAndEditView(item: nil, { item in
                        self.viewModel.addItem(item)
                    })
                , isActive: $isShowingCreateView) {}
                NavigationLink(
                    destination: CreateAndEditView(item: currentItem) { item in
                        self.viewModel.addItem(item)
                    }
                    , isActive: $isSHowingEditView) {}
                
            }.navigationBarTitle("Items")
            .navigationBarItems(trailing: Button(action: {isShowingCreateView = true}, label: {
                Image(systemName: "plus")
            }))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ItemsTableView()
    }
}
