//
//  RaceRepoMock.swift
//  DomainLayerTests
//
//  Created by Duy Le on 19/6/2024.
//

import Foundation
@testable import DomainLayer

class RaceRepoMock: RaceRepoProtocol {
    
    var getNextRacesResultMock: Result<[Race], ApiError>!
    
    func getNextRaces(count: Int) async -> Result<[Race], ApiError> {
        return getNextRacesResultMock
    }
    
}
