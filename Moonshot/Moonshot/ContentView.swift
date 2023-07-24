//
//  ContentView.swift
//  Moonshot
//
//  Created by Isaque da Silva on 21/07/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        let astronault: [String: Astronaut] = Bundle.main.decode("astronauts.json")
        let mission: [Missions] = Bundle.main.decode("missions.json")
        VStack {
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
