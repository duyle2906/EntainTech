//
//  RaceRepoTests.swift
//  DataLayerTests
//
//  Created by Duy Le on 19/6/2024.
//

import XCTest
@testable import DomainLayer
@testable import DataLayer

final class RaceRepoTests: XCTestCase {
    
    var sut: RaceRepo!
    var remoteDataSource: RaceRemoteDataSourceMock!

    override func setUpWithError() throws {
        remoteDataSource = RaceRemoteDataSourceMock()
        sut = RaceRepo(remoteDatasource: remoteDataSource)
    }

    override func tearDownWithError() throws {
        remoteDataSource = nil
        sut = nil
        try super.tearDownWithError()
    }

    func testGetNextRacesSuccessful() async throws {
        let response: GetNextRacesResponse = JsonLoader.loadJSON(fileName: "races")
        remoteDataSource.getNextRacesResponse = .success(response)
        let races = try await sut.getNextRaces(count: 10).get()
        XCTAssertEqual(races.count, 10)
    }
    
    func testGetNextRacesFailed() async {
        let expectedError = ApiError(errorCode: "errorcode", message: "message")
        remoteDataSource.getNextRacesResponse = .failure(expectedError)
        let result = await sut.getNextRaces(count: 10)
        switch result {
        case let .success(value):
            XCTFail("Expected to be a failure but got a success with \(value)")
        case let .failure(error):
            XCTAssertEqual(error.message, expectedError.message)
        }
    }

}
