//
//  ContentView.swift
//  Moonshot
//
//  Created by Isaque da Silva on 21/07/23.
//

import SwiftUI

struct User: Codable {
    let name: String
    let age: Int
    let adress: Adress
}

struct Adress: Codable {
    let street: String
    let number: Int
    let city: String
    let uf: String
}

struct ContentView: View {
    @State private var name = ""
    @State private var age = 0
    @State private var adress = ""
    
    @State private var showingView = false
    
    var body: some View {
        VStack {
            Button("Decode JSON", action: {
                let input = """
                {
                    "name": "Isaque da Silva Machado",
                    "age": 18
                    "adress": {
                        "street": Rua 6
                        "number": 96
                        "city": "Resende"
                        "uf": "RJ"
                    }
                }
                """
                
                let data = Data(input.utf8)
                let decoder = JSONDecoder()
                
                if let user = try? decoder.decode(User.self, from: data) {
                    name = user.name
                    age = user.age
                    adress = "Rua \(user.adress.street), numero \(user.adress.number), \(user.adress.city) - \(user.adress.uf)"
                    
                    showingView = true
                }
            })
            
            if showingView {
                Text("Usuario")
                Text("Nome: \(name)")
                Text("Idade: \(age)")
                Text("Endereço: \(adress)")
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
