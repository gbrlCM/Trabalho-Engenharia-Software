//
//  ItemRow.swift
//  EngenhariaDeSoftware (iOS)
//
//  Created by Gabriel Ferreira de Carvalho on 07/05/21.
//

import SwiftUI

struct ItemRow: View {
    
    var item: Item
    let action: () -> Void
    
    var body: some View {
        VStack {
            HStack {
                Text("\(item.name)")
                    .font(.title2)
                    .fontWeight(.bold)
                Spacer()
                Button(action: action, label: {
                    Text("Edit")
                        .foregroundColor(.blue)
                        .fontWeight(.bold)
                })
            }
            HStack {
                Text("Estoque: \(item.stock), preço: R$ \(item.price)")
                Spacer()
            }
        }.padding(16)
    }
}

struct ItemRow_Previews: PreviewProvider {
    
    static var previews: some View {
        ItemRow(item: Item(id: 1, name: "Pudim", stock: 200, supplier: "fornecedor", category: "comida", price: 2.5), action: { print("Pudim")})
    }
}
