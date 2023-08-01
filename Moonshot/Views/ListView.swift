//
//  ListView.swift
//  Moonshot
//
//  Created by Isaque da Silva on 25/07/23.
//

import SwiftUI

struct ListView: View {
    let mission: [Missions]
    let astronaut: [String: Astronaut]
    
    var body: some View {
        NavigationStack{
            List {
                Section {
                    ForEach(mission) { mission in
                        NavigationLink {
                            MissionView(mission: mission, astronalts: astronaut)
                        } label: {
                            HStack {
                                Image(mission.displayImage)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 50, height: 50)
                                
                                VStack(alignment: .leading) {
                                    Text(mission.displayName)
                                        .font(.title3.bold())
                                    Text(mission.formattedLaunchDate)
                                        .font(.subheadline.bold())
                                }
                                .padding(.horizontal)
                            }
                        }
                    }
                }
                .listRowBackground(Color("BackgroundColor"))
            }
            .listStyle(.plain)
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static let mission: [Missions] = Bundle.main.decode("missions.json")
    static let astronaut: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    static var previews: some View {
        ListView(mission: mission, astronaut: astronaut)
    }
}
