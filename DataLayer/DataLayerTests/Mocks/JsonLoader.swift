//
//  JsonLoader.swift
//  DataLayerTests
//
//  Created by Duy Le on 19/6/2024.
//

import Foundation

class JsonLoader {
    
    static func loadJSON<T: Decodable>(fileName: String) -> T {
        guard let path = Bundle(for: JsonLoader.self).url(forResource: fileName, withExtension: "json") else {
            fatalError("Failed to load JSON")
        }
        
        do {
            let data = try Data(contentsOf: path)
            let decoder = JSONDecoder()
            let json = try decoder.decode(T.self, from: data)
            return json
        } catch let error {
            fatalError("Failed to decode JSON \(error.localizedDescription)")
        }
    }
    
}
