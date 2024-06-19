//
//  RaceRemoteDataSourceMock.swift
//  DataLayerTests
//
//  Created by Duy Le on 19/6/2024.
//

import XCTest
@testable import DomainLayer
@testable import DataLayer

class RaceRemoteDataSourceMock: RaceRemoteDataSourceProtocol {
    
    var getNextRacesResponse: Result<GetNextRacesResponse, ApiError>?
    
    func getNextRaces(count: Int) async throws -> GetNextRacesResponse {
        guard let response = getNextRacesResponse else {
            fatalError("No response")
        }
        switch response {
        case .success(let races):
            return races
        case .failure(let error):
            throw error
        }
    }
    
}
