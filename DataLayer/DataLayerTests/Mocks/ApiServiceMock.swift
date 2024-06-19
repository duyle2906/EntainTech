//
//  ApiServiceMock.swift
//  DataLayerTests
//
//  Created by Duy Le on 19/6/2024.
//

import Foundation
@testable import DataLayer

class ApiServiceMock: ApiServiceProtocol {
    
    var mockFileName: String!
    
    func requestAsync<T: Decodable>(endpoint: any EndpointProtocol) async throws -> T {
        return JsonLoader.loadJSON(fileName: mockFileName)
    }
        
}

