//
//  RaceRepoProtocol.swift
//  DomainLayer
//
//  Created by Duy Le on 19/6/2024.
//

import Foundation

public protocol RaceRepoProtocol {
    
    func getNextRaces() async -> Result<[Race], ApiError>
    
}
