//
//  ContentView.swift
//  Moonshot
//
//  Created by Isaque da Silva on 21/07/23.
//

import SwiftUI

struct ContentView: View {
    let astronault: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let mission: [Missions] = Bundle.main.decode("missions.json")
    
    let colums = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: colums) {
                    ForEach(mission) { mission in
                        NavigationLink {
                            MissionView(mission: mission, astronalts: astronault)
                        } label: {
                            VStack {
                                Image(mission.displayImage)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80, height: 80)
                                    .padding()
                                VStack {
                                    Text(mission.displayName)
                                        .font(.title3.bold())
                                        .foregroundColor(.white)
                                    
                                    Text(mission.formattedLaunchDate)
                                        .font(.headline.bold())
                                        .foregroundColor(.white.opacity(0.5))
                                }
                                .padding(.vertical)
                                .frame(maxWidth: .infinity)
                                .background(Color("InformationColor"))
                            }
                            .frame(maxWidth: .infinity)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .overlay {
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color("InformationColor"))
                            }
                        }
                    }
                }
                .padding([.horizontal, .bottom])
            }
            .navigationTitle("Moonshot")
            .background(Color("BackgroundColor"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
