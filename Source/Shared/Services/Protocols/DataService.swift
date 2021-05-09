//
//  DataService.swift
//  EngenhariaDeSoftware (iOS)
//
//  Created by Gabriel Ferreira de Carvalho on 07/05/21.
//

import Foundation
import Combine

protocol DataService {
    
    func getAllItems() -> AnyPublisher<[Item], Never>
    func getBy(id : Int) -> AnyPublisher<Item, Never>
    func removeBy(id: Int)
    func filterBy(name: String) -> [Item]
}
