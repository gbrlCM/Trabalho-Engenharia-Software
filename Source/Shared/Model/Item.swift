//
//  Item.swift
//  EngenhariaDeSoftware (iOS)
//
//  Created by Gabriel Ferreira de Carvalho on 07/05/21.
//

import Foundation

struct Item: Codable, Identifiable {
    let id: Int
    var name: String
    let stock: Int
    let supplier: String
    let category: String
    let price: Float
}
