//
//  ContentView.swift
//  Moonshot
//
//  Created by Isaque da Silva on 21/07/23.
//

import SwiftUI

struct ContentView: View {
    @State private var showingGrid = true
    let astronaut: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let mission: [Missions] = Bundle.main.decode("missions.json")
    
    var body: some View {
        NavigationStack {
            Group {
                if showingGrid {
                   GridView(mission: mission, astronaut: astronaut)
                } else {
                    ListView(mission: mission, astronaut: astronaut)
                }
            }
            .navigationTitle("Moonshot")
            .toolbar {
                Button(action: {
                    showingGrid.toggle()
                }, label: {
                    if showingGrid {
                        Image(systemName: "list.bullet")
                    } else {
                        Image(systemName: "square.grid.2x2")
                    }
                })
            }
            .background(Color("BackgroundColor"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
