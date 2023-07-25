//
//  MissionView.swift
//  Moonshot
//
//  Created by Isaque da Silva on 23/07/23.
//

import SwiftUI

struct MissionView: View {
    struct CrewMembers {
        let role: String
        let astronaut: Astronaut
    }
    
    let mission: Missions
    let crew: [CrewMembers]
    
    var body: some View {
        GeometryReader { geo in
            ScrollView {
                LazyVStack {
                    VStack {
                        Image(mission.displayImage)
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: geo.size.width * 0.6)
                            .padding()
                            .shadow(radius: 10)
                    }
                    .frame(maxWidth: geo.size.width * 0.9)
                    .background(.thinMaterial)
                    .cornerRadius(10)
                    .foregroundColor(.white.opacity(0.6))
                    .shadow(radius: 10)
                    .padding([.top, .bottom])
                    
                    DividerView(text: "Launch Date: \((mission.formattedLaunchDate))", showingLine: true)
                        .font(.headline.bold())
                    
                    LazyVStack(alignment: .leading) {
                        Text("Mission Highlights:")
                            .font(.title.bold())
                            .padding([.top, .bottom], 5)
                        
                        Text(mission.description)
                            .font(.headline.bold())
                            .padding(.bottom, 5)
                        Rectangle()
                            .frame(height: 2)
                    }
                    .padding(.horizontal)
                    
                    DividerView(text: "Crew:", showingLine: false)
                        .font(.title.bold())
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack {
                            ForEach(crew, id: \.role) { crewMember in
                                NavigationLink {
                                    AstronautView(astronaut: crewMember.astronaut)
                                } label: {
                                    LazyHStack {
                                        VStack {
                                            Image(crewMember.astronaut.id)
                                                .resizable()
                                                .frame(width: 173.333, height: 120)
                                                .cornerRadius(10)
                                                .padding()
                                            
                                            VStack {
                                                Text(crewMember.astronaut.name)
                                                    .font(.headline.bold())
                                                    .foregroundColor(.white)
                                                
                                                Text(crewMember.role)
                                                    .font(.subheadline.bold())
                                                    .foregroundColor(.white.opacity(0.5))
                                            }
                                            .frame(maxWidth: .infinity)
                                            .padding([.horizontal, .top, .bottom])
                                            .background(Color("InformationColor"))
                                        }
                                        .clipShape(RoundedRectangle(cornerRadius: 10))
                                        .overlay {
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke(Color("InformationColor"))
                                        }
                                        .padding()
                                    }
                                }
                            }
                        }
                    }
                    
                }
            }
        }
        .navigationTitle(mission.displayName)
        .navigationBarTitleDisplayMode(.inline)
        .background(Color("BackgroundColor"))
    }
    
    init(mission: Missions, astronalts: [String: Astronaut]) {
        self.mission = mission
        self.crew = mission.crew.map { member in
            if let astronaut = astronalts[member.name] {
                return CrewMembers(role: member.role, astronaut: astronaut)
            } else {
                fatalError("Missing \(member.name)")
            }
        }
    }
}

struct MissionView_Previews: PreviewProvider {
    static let mission: [Missions] = Bundle.main.decode("missions.json")
    static let astronault: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    static var previews: some View {
        MissionView(mission: mission[0], astronalts: astronault)
    }
}
