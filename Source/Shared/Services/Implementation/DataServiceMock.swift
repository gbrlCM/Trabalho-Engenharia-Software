//
//  DataServiceMock.swift
//  EngenhariaDeSoftware (iOS)
//
//  Created by Gabriel Ferreira de Carvalho on 07/05/21.
//

import Foundation
import Combine

class DSMock: DataService {
    
    var items: [Item] = [
        Item(id: 0, name: "Pudim", stock: 250, supplier: "Casa do Pudim", category: "Coisa dos deuses", price: 1.5),
        Item(id: 1, name: "Chave de fenda", stock: 10, supplier: "TendTudo", category: "Material de construção", price: 20),
        Item(id: 2, name: "Robo mario", stock: 1, supplier: "BAEA", category: "UM ROBO", price: 100000)
    ]
    
    func getAllItems() -> AnyPublisher<[Item], Never> {
        Just(items)
            .eraseToAnyPublisher()
    }
    
    func getBy(id: Int) -> AnyPublisher<Item, Never> {
        let item = items.filter { $0.id == id}.first!
        return Just(item).eraseToAnyPublisher()
    }
    
    func removeBy(id: Int) {
        items = items.filter { $0.id != id }
    }
    
    func filterBy(name: String) -> [Item] {
        return items.filter { $0.name == name}
    }
}
