//
//  RaceRepo.swift
//  DataLayer
//
//  Created by Duy Le on 19/6/2024.
//

import Foundation
import DomainLayer

public class RaceRepo: RaceRepoProtocol {
    
    var remoteDatasource: RaceRemoteDataSourceProtocol!
    
    public init(remoteDatasource: RaceRemoteDataSourceProtocol!) {
        self.remoteDatasource = remoteDatasource
    }
    
    public func getNextRaces(count: Int) async -> Result<[Race], ApiError> {
        do {
            let response = try await remoteDatasource.getNextRaces(count: count)
            return .success(response.toEntities())
        } catch let error {
            return .failure(error as? ApiError ?? ApiError.unknownError())
        }
    }
    
}

