//
//  CreateAndEditView.swift
//  EngenhariaDeSoftware (iOS)
//
//  Created by Gabriel Ferreira de Carvalho on 07/05/21.
//

import SwiftUI

struct CreateAndEditView: View {
    
    var item: Item?
    var label: String
    var action: (_ item: Item) -> Void
    
    @State var name: String
    @State var category: String
    @State var stock: Int?
    @State var supplier: String
    @State var price: Float?
    @State var shoudShowAlert: Bool = false
    
    
    init(item: Item?, _ action: @escaping (_ item: Item) -> Void) {
        self.item = item
        if let item = item {
            self.label = "Editar"
            name = item.name
            category = item.category
            stock = item.stock
            supplier = item.supplier
            price = item.price
            
        } else {
            self.label = "Criar"
            self.name = ""
            self.category = ""
            self.stock = nil
            self.supplier = ""
            self.price = nil
        }
        
        self.action = action
    }
    
    private func generateItem() -> Item {
        guard let item = self.item, let stock = self.stock, let price = self.price else {
            return Item(id: -1, name: name, stock: stock!, supplier: supplier, category: category, price: price!)
        }
        
        return Item(id: item.id, name: name, stock: stock, supplier: supplier, category: category, price: price)
    }
    
    var body: some View {
        VStack {
            Form {
                Section(header: Text("Informações gerais")) {
                    HStack {
                        Text("Nome:")
                        TextField("Produto A", text: $name)
                    }
                    HStack {
                        Text("Categoria:")
                        TextField("Comestiveis", text: $category)
                    }
                    HStack {
                        Text("Fornecedor:")
                        TextField("Empresa A", text: $supplier)
                    }
                }
                
                Section(header: Text("Dados Númericos")) {
                    
                    HStack {
                        Text("Estoque:")
                        TextField("42", value: $stock, formatter: NumberFormatter())
                            .keyboardType(.numberPad)
                    }
                    
                    HStack {
                        Text("Preço: R$")
                        TextField("1.99", value: $price, formatter: NumberFormatter())
                            .keyboardType(.numbersAndPunctuation)
                    }
                    
                }
            }
            HStack {
                Spacer()
                Button(action: {
                    guard stock != nil , price != nil else {
                        shoudShowAlert = true
                        return
                    }
                    action(generateItem())
                }) {
                    Text("Salva")
                        .fontWeight(.bold)
                }
                    .buttonStyle(BlueButton())
                Spacer()
            }
        }.navigationTitle(label)
        .alert(isPresented: $shoudShowAlert) {
            Alert(title: Text("Termine o Formulário"), message: Text("Valores não válidos foram imputados, porfavor os corrija"), dismissButton: .default(Text("Okay!")))
        }
        
        
    }
    
    struct BlueButton: ButtonStyle {
        func makeBody(configuration: Configuration) -> some View {
            configuration.label
                .padding(EdgeInsets(top: 8, leading: 64, bottom: 8, trailing: 64))
                .background(Color.blue)
                .foregroundColor(.white)
                .clipShape(Capsule())
        }
    }
}

struct CreateAndEditView_Previews: PreviewProvider {
    static var previews: some View {
        CreateAndEditView(item: nil) { _ in }
    }
}
