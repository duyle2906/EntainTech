//
//  ApiServiceTests.swift
//  DataLayerTests
//
//  Created by Duy Le on 19/6/2024.
//

@testable import DataLayer
import DomainLayer
import XCTest

final class ApiServiceTest: XCTestCase {
    var sut: ApiService!

    override func setUpWithError() throws {
        sut = ApiService()
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }

    func testRequestAsyncSuccessful() async throws {
        let endpoint = RaceEndpoint.getNextRaces(count: 10)
        let response: GetNextRacesResponse = try await sut.requestAsync(endpoint: endpoint)
        XCTAssertEqual(response.toEntities().count, 10)
    }

    func testRequestAsyncFailed() async {
        let endpoint = EndpointMock(pathMock: "/rest/v1/racing1")
        do {
            let response: GetNextRacesResponse = try await sut.requestAsync(endpoint: endpoint)
            XCTFail("Expected error to be thrown")
        } catch let error as ApiError {
            XCTAssertEqual(error.errorCode, ApiError.unknownError().errorCode)
            XCTAssertEqual(error.message, ApiError.unknownError().message)
        } catch {
            XCTFail("Expected error to be ApiError")
        }
    }
}
