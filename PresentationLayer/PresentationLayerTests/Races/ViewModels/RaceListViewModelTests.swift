//
//  RaceListViewModelTests.swift
//  PresentationLayerTests
//
//  Created by Duy Le on 20/6/2024.
//

import XCTest
import DomainLayer
@testable import PresentationLayer

final class RaceListViewModelTests: XCTestCase {
    
    var sut: RaceListViewModel!
    var raceInteractorMock: ViewResolverMock.RaceInteractorMock!

    override func setUpWithError() throws {
        raceInteractorMock = ViewResolverMock.RaceInteractorMock()
        sut = RaceListViewModel(interactor: raceInteractorMock)
    }

    override func tearDownWithError() throws {
        raceInteractorMock = nil
        sut = nil
        try super.tearDownWithError()
    }

    @MainActor func testGetNextRacesSuccessful() async {
        await sut.getNextRaces()
        XCTAssertEqual(sut.displayedRaces.count, 10)
        XCTAssertEqual(sut.uiState, .loaded)
    }
    
    @MainActor func testGetNextRacesFailed() async {
        raceInteractorMock.getNextRacesResult = .failure(ApiError.unknownError())
        await sut.getNextRaces()
        XCTAssertEqual(sut.uiState, .error(ApiError.unknownError().message))
    }
    
    @MainActor func testCheckExpiredRaces() async {
        await sut.getNextRaces()
        XCTAssertEqual(sut.displayedRaces.count, 10)
        // Get the earliest race's start time, assuming that all 10 races in the mock have unique start time and they have been sorted ascendingly
        guard let earliestRaceStartTime = sut.displayedRaces.first?.startTimeInSeconds else {
            fatalError("Invalid mock data")
        }
        // Get a current time that is 61 seconds later of the earliest start time
        let currentTime = Date(timeIntervalSince1970: earliestRaceStartTime + 61)
        
        sut.checkExpiredRaces(currentTime: currentTime)
        
        // Assert that one race has been removed from the displayed race list
        XCTAssertEqual(sut.displayedRaces.count, 9)
    }

}
