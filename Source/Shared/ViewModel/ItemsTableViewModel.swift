//
//  ItemsTableViewModel.swift
//  EngenhariaDeSoftware (iOS)
//
//  Created by Gabriel Ferreira de Carvalho on 07/05/21.
//

import Foundation
import Combine

final class ItemsTableViewModel: ObservableObject {
    
    private let dataService: DataService = DSMock()
    private var cancellables = Set<AnyCancellable>()
    
    @Published var items: [Item] = []
    
    init() {
        getItems()
    }
    
    private func getItems() {
        dataService
            .getAllItems()
            .assign(to: \.items, on: self)
            .store(in: &cancellables)
    }
    
    public func addItem(_ item: Item) {
        items.append(item)
    }
    
    public func replaceItem(in index: Int, for item: Item) {
        guard index < items.count , index >= 0 else {
            print(index)
            return
        }
        items[index] = item
    }
    
}
