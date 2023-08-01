//
//  GridView.swift
//  Moonshot
//
//  Created by Isaque da Silva on 25/07/23.
//

import SwiftUI

struct GridView: View {
    let mission: [Missions]
    let astronaut: [String: Astronaut]
    
    let colums = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: colums) {
                    ForEach(mission) { mission in
                        NavigationLink {
                            MissionView(mission: mission, astronalts: astronaut)
                        } label: {
                            VStack{
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
                            .padding([.horizontal, .bottom], 10)
                        }
                    }
                }
            }
        }
    }
}

struct GridView_Previews: PreviewProvider {
    static let mission: [Missions] = Bundle.main.decode("missions.json")
    static let astronault: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    static var previews: some View {
        GridView(mission: mission, astronaut: astronault)
    }
}
