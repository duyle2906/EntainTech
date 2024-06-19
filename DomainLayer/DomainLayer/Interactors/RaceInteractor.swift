//
//  RaceInteractor.swift
//  DomainLayer
//
//  Created by Duy Le on 19/6/2024.
//

import Foundation

public protocol RaceInteractorProtocol {
    
    func getNextRaces(count: Int) async -> Result<[Race], ApiError>
    
}

public class RaceInteractor: RaceInteractorProtocol {
    
    let repo: RaceRepoProtocol
    
    public init(repo: RaceRepoProtocol) {
        self.repo = repo
    }
    
    public func getNextRaces(count: Int) async -> Result<[Race], ApiError> {
        return await repo.getNextRaces(count: count)
    }
    
}
