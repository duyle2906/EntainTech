//
//  RaceRemoteDataSource.swift
//  DataLayer
//
//  Created by Duy Le on 19/6/2024.
//

import Foundation
import DomainLayer

public protocol RaceRemoteDataSourceProtocol {
    
    func getNextRaces(count: Int) async throws -> GetNextRacesResponse
    
}

public class RaceRemoteDataSource: RaceRemoteDataSourceProtocol {
    
    var apiService: ApiServiceProtocol!
    
    public init(apiService: ApiServiceProtocol!) {
        self.apiService = apiService
    }
    
    public func getNextRaces(count: Int) async throws -> GetNextRacesResponse {
        return try await apiService.requestAsync(endpoint: RaceEndpoint.getNextRaces(count: count))
    }
    
}
