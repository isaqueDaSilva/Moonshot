//
//  AstronautView.swift
//  Moonshot
//
//  Created by Isaque da Silva on 24/07/23.
//

import SwiftUI

struct AstronautView: View {
    let astronaut: Astronaut
    
    var body: some View {
        ScrollView {
            VStack {
                Image(astronaut.id)
                    .resizable()
                    .scaledToFit()
                
                Text(astronaut.description)
                    .font(.headline.bold())
                    .padding([.horizontal, .top], 10)
            }
        }
        .background(Color("BackgroundColor"))
        .navigationTitle(astronaut.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct AstronautView_Previews: PreviewProvider {
    static let astronault: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    static var previews: some View {
        AstronautView(astronaut: astronault["aldrin"]!)
    }
}
