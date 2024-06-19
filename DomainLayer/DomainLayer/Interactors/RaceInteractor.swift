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
        do {
            let races = try await repo.getNextRaces(count: count).get()
            // sort races by the start time ascending
            let sortedRaces = races.sorted { race1, race2 in
                race1.startTimeInSeconds < race2.startTimeInSeconds
            }
            return .success(sortedRaces)
        } catch let error {
            return .failure(error as? ApiError ?? ApiError.unknownError())
        }
    }
    
}
