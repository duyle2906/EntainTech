//
//  Race+Stub.swift
//  DomainLayerTests
//
//  Created by Duy Le on 19/6/2024.
//

@testable import DomainLayer
import Foundation

extension Race {
    static func stubArray() -> [Self] {
        return [
            Race(id: "00ef27df-93b2-4fd7-ae45-80bdcafe71bf", category: .greyhound, meetingName: "The Meadows", raceNumber: 1, startTimeInSeconds: TimeInterval(1718786640)),
            Race(id: "53619a74-192e-439d-ab05-5cc3af0f6540", category: .greyhound, meetingName: "Temora", raceNumber: 11, startTimeInSeconds: TimeInterval(1718786220)),
            Race(id: "631b071e-75f7-4c9a-a8ae-fcad1c492dbe", category: .greyhound, meetingName: "Twitter @ Brisgreys", raceNumber: 11, startTimeInSeconds: TimeInterval(1718786820)),
            Race(id: "71947940-6754-4c7f-9d09-2298f7df849a", category: .harness, meetingName: "Redcliffe", raceNumber: 5, startTimeInSeconds: TimeInterval(1718787180)),
            Race(id: "9c9a869f-1659-45ea-9b74-49492c07ccdc", category: .horse, meetingName: "Peninsula Dining Room (Rs0ly)", raceNumber: 1, startTimeInSeconds: TimeInterval(1718787000)),
            Race(id: "a5c4934a-61ea-46de-a537-adeb18e88cd6", category: .horse, meetingName: "Langlands Hanlon Pace", raceNumber: 4, startTimeInSeconds: TimeInterval(1718786340)),
            Race(id: "b2fd634c-4046-417e-a302-c4bd36ac6d1e", category: .horse, meetingName: "Toulouse", raceNumber: 1, startTimeInSeconds: TimeInterval(1718787000)),
            Race(id: "d68ec6ac-4825-417e-841d-8caad777e24e", category: .greyhound, meetingName: "Temora", raceNumber: 12, startTimeInSeconds: TimeInterval(1718787240)),
            Race(id: "d75a0b36-5719-418e-b588-9d0edf8be923", category: .horse, meetingName: "Urawa", raceNumber: 11, startTimeInSeconds: TimeInterval(1718786700)),
            Race(id: "e975e06f-e622-433f-b227-71d0ce60fb0d", category: .horse, meetingName: "Sonoda", raceNumber: 1, startTimeInSeconds: TimeInterval(1718787300)),
        ]
    }
}
