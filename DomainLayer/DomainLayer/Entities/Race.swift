//
//  Race.swift
//  DomainLayer
//
//  Created by Duy Le on 19/6/2024.
//

import Foundation

public enum RaceCategory: String {
    case greyhound = "Greyhound"
    case harness = "Harness"
    case horse = "Horse"
    case unknown = "Unknown"
}

public struct Race: Hashable, Identifiable {
    public let id: String
    public let category: RaceCategory
    public let meetingName: String
    public let raceNumber: Int
    public let startTimeInSeconds: TimeInterval
    
    public init(id: String, category: RaceCategory, meetingName: String, raceNumber: Int, startTimeInSeconds: TimeInterval) {
        self.id = id
        self.category = category
        self.meetingName = meetingName
        self.raceNumber = raceNumber
        self.startTimeInSeconds = startTimeInSeconds
    }
}
