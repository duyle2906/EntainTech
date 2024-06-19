//
//  RaceRemoteDataSourceTests.swift
//  DataLayerTests
//
//  Created by Duy Le on 19/6/2024.
//

import XCTest
@testable import DataLayer

final class RaceRemoteDataSourceTests: XCTestCase {
    
    var sut: RaceRemoteDataSource!
    var apiService: ApiServiceMock!

    override func setUpWithError() throws {
        apiService = ApiServiceMock()
        sut = RaceRemoteDataSource(apiService: apiService)
    }

    override func tearDownWithError() throws {
        apiService = nil
        sut = nil
        try super.tearDownWithError()
    }

    func testGetNextRaces() async throws {
        apiService.mockFileName = "races"
        let response = try await sut.getNextRaces(count: 10)
        XCTAssertEqual(response.toEntities().count, 10)
    }

}

