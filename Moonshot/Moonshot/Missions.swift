//
//  Missions.swift
//  Moonshot
//
//  Created by Isaque da Silva on 23/07/23.
//

import Foundation

struct Missions: Codable, Identifiable {
    struct CrewRole: Codable {
        let name: String
        let role: String
    }
    
    let id: Int
    let launchDate: String?
    let crew: [CrewRole]
    let description: String
    
    var displayName: String {
        return "Apollo \(id)"
    }
    
    var displayImage: String {
        return "apollo\(id)"
    }
}
