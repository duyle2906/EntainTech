//
//  RaceListViewUITests.swift
//  EntainTechUITests
//
//  Created by Duy Le on 20/6/2024.
//

import XCTest
import PresentationLayer
import DomainLayer

final class RaceListViewUITests: XCTestCase {

    private var app: XCUIApplication!
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launchArguments.append("Testing")
        app.launch()
    }

    override func tearDownWithError() throws {
        app = nil
        try super.tearDownWithError()
    }

    func testRaceListLoadedSuccessfully() throws {
        // check if the list is loaded
        let raceList = app.collectionViews[ViewIdentifiers.Races.list]
        XCTAssert(raceList.waitForExistence(timeout: 2))
        
        // Scroll through the list to collect all cell identifiers
        let predicate = NSPredicate(format: "identifier BEGINSWITH '\(ViewIdentifiers.Races.cell)'")
        var allCellIndetifiers: Set<String> = Set()
        var lastCellIdentifier: String?
        
        let maxScrolls = 2
        var count = 0
        while count < maxScrolls {
            let matchingCells = raceList.descendants(matching: .any).matching(predicate)
            
            for index in 0..<matchingCells.count {
                let cell = matchingCells.element(boundBy: index)
                let identifier = cell.identifier
                if identifier != lastCellIdentifier {
                    allCellIndetifiers.insert(identifier)
                    lastCellIdentifier = identifier
                }
            }
            
            // Scroll to the last visible cell to load more cells
            let lastVisibleCell = matchingCells.element(boundBy: matchingCells.count - 1)
            if lastVisibleCell.exists && lastVisibleCell.isHittable {
                lastVisibleCell.swipeUp()
                count += 1
            } else {
                break
            }
        }
        
        // check if the list has 10 race cells
        XCTAssertEqual(allCellIndetifiers.count, 10)
    }
    
    func testFilterRaceListByCategory() throws {
        // check if all category toggle exists
        let greyhoundToggle = app.switches["\(ViewIdentifiers.Races.category)_\(RaceCategory.greyhound.rawValue)"]
        let harnessToggle = app.switches["\(ViewIdentifiers.Races.category)_\(RaceCategory.harness.rawValue)"]
        let horseToggle = app.switches["\(ViewIdentifiers.Races.category)_\(RaceCategory.horse.rawValue)"]
        
        XCTAssertTrue(greyhoundToggle.exists)
        XCTAssertTrue(harnessToggle.exists)
        XCTAssertTrue(horseToggle.exists)
        
        // check if all list sections exist
        let greyhoundSection = app.collectionViews.descendants(matching: .any)["\(ViewIdentifiers.Races.section)_\(RaceCategory.greyhound.rawValue)"]
        let harnessSection = app.collectionViews.descendants(matching: .any)["\(ViewIdentifiers.Races.section)_\(RaceCategory.harness.rawValue)"]
        let horseSection = app.collectionViews.descendants(matching: .any)["\(ViewIdentifiers.Races.section)_\(RaceCategory.horse.rawValue)"]
        
        XCTAssertTrue(greyhoundSection.exists)
        XCTAssertTrue(harnessSection.exists)
        XCTAssertTrue(horseSection.exists)
        
        // deselect greyhound and expect the greyhound section to be hidden
        greyhoundToggle.tap()
        XCTAssertFalse(greyhoundSection.exists)
        XCTAssertTrue(harnessSection.exists)
        XCTAssertTrue(horseSection.exists)
        
        // deselect harness and horse and expect all sections to show again
        harnessToggle.tap()
        horseToggle.tap()
        XCTAssertTrue(greyhoundSection.exists)
        XCTAssertTrue(harnessSection.exists)
        XCTAssertTrue(horseSection.exists)
    }
    
    func testExpiredRaceToDisappear() throws {
        // first cell in the mock data is set to TimeInterval(Date.now.timeIntervalSince1970 - 52)
        // it means this cell is supposed to disappear after 9 seconds
        let raceList = app.collectionViews[ViewIdentifiers.Races.list]
        
        // check if first cell is loaded successfully
        let firstCell = raceList.descendants(matching: .any)["\(ViewIdentifiers.Races.cell)_00ef27df-93b2-4fd7-ae45-80bdcafe71bf"]
        XCTAssertTrue(firstCell.exists)
        
        // wait for 9 seconds and expect the first cell to disappear
        sleep(9)
        XCTAssertFalse(firstCell.exists)
    }

}
