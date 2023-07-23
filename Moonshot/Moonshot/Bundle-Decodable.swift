//
//  Bundle-Decodable.swift
//  Moonshot
//
//  Created by Isaque da Silva on 23/07/23.
//

import Foundation

extension Bundle {
    func decode<T: Codable>(_ file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to Locate \(file) in Bundle.")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to Load \(file) in Bundle.")
        }
        
        let decoder = JSONDecoder()
        
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to Decode \(file) in Bundle.")
        }
        
        return loaded
    }
}
