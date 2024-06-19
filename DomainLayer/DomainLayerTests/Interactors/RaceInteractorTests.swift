//
//  RaceInteractorTests.swift
//  DomainLayerTests
//
//  Created by Duy Le on 19/6/2024.
//

import XCTest
@testable import DomainLayer

final class RaceInteractorTests: XCTestCase {
    
    var sut: RaceInteractor!
    var repo: RaceRepoMock!

    override func setUpWithError() throws {
        repo = RaceRepoMock()
        sut = RaceInteractor(repo: repo)
    }

    override func tearDownWithError() throws {
        repo = nil
        sut = nil
        try super.tearDownWithError()
    }

    func testGetRacePageFailed() async throws {
        let error = ApiError(statusCode: 0, errorCode: "ErrorCode", message: "Message")
        repo.getNextRacesResultMock = .failure(error)
        let result = await sut.getNextRaces(count: 10)

        switch result {
        case let .success(value):
            XCTFail("Expected to be a failure but got a success with \(value)")
        case let .failure(resultError):
            XCTAssertEqual(resultError.message, error.message)
        }
    }

    func testGetRacePageSuccessful() async throws {
        let races = Race.stubArray()
        let sortedTimes = races.map({ $0.startTimeInSeconds }).sorted()
        repo.getNextRacesResultMock = .success(races)
        let result = await sut.getNextRaces(count: 10)

        switch result {
        case let .success(value):
            XCTAssertEqual(value.count, 10)
            XCTAssertTrue(value.map({ $0.startTimeInSeconds }) == sortedTimes)
        case let .failure(resultError):
            XCTFail("Expected to be a success but got a failure with \(resultError.localizedDescription)")
        }
    }
    
}
