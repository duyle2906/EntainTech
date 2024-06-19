//
//  ApiServiceMock.swift
//  DataLayerTests
//
//  Created by Duy Le on 19/6/2024.
//

import Foundation

import Foundation
@testable import DataLayer

class ApiServiceMock: ApiServiceProtocol {
    
    var mockFileName: String!
    
    func requestAsync<T: Decodable>(endpoint: any EndpointProtocol) async throws -> T {
        return loadJSON()
    }
        
    private func loadJSON<T: Decodable>() -> T {
        guard let path = Bundle(for: type(of: self)).url(forResource: mockFileName, withExtension: "json") else {
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
