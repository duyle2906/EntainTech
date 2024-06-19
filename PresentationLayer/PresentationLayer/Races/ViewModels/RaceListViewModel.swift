//
//  RaceListViewModel.swift
//  PresentationLayer
//
//  Created by Duy Le on 19/6/2024.
//

import Foundation
import DomainLayer
import Combine

public class RaceListViewModel: ObservableObject {
    
    // MARK: Published properties
    @Published var selectedCategories: [DisplayedRaceCategory] = [
        DisplayedRaceCategory(category: .greyhound, isSelected: true),
        DisplayedRaceCategory(category: .harness, isSelected: true),
        DisplayedRaceCategory(category: .horse, isSelected: true)
    ]
    @Published private(set) var displayedRaces: [Race] = []
    
    // MARK: Depencencies
    var interactor: RaceInteractorProtocol
    
    public init(interactor: RaceInteractorProtocol) {
        self.interactor = interactor
    }

    // MARK: Functions
    
    // This function will get next races from the interactor
    @MainActor
    func getNextRaces() async {
        let result = await interactor.getNextRaces(count: 10)
        switch result {
        case let .success(races):
            displayedRaces = races
        case .failure:
            break
        }
    }
    
    // This function will remove the races that are one minute past the advertised start
    @MainActor
    func checkExpiredRaces(currentTime: Date) {
        displayedRaces = displayedRaces.filter { race in
            return Int(race.startTimeInSeconds) - Int(currentTime.timeIntervalSince1970) > -60
        }
    }
    
    
}
