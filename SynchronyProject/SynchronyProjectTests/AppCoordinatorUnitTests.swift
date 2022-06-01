//
//  AppCoordinatorUnitTests.swift
//  SynchronyProjectTests
//
//  Created by Robin Lopez Ordonez on 1/25/21.
//

import XCTest
@testable import SynchronyProject

class AppCoordinatorUnitTests: XCTestCase {
    
    var appCoord: AppCoordinator!

    override func setUp() {
        appCoord = AppCoordinator(navigationController: UINavigationController())
    }
    
    func test_AppCoordinatorStartWithNoChildren() {
        appCoord.start()
        XCTAssertTrue(appCoord.childCoordinators.count == 0)
    }
    
    func test_CountriesDataIsPopulated() {
        appCoord.start()
        XCTAssertFalse(appCoord.countriesData.count == 0)
    }
    
    func test_profileScreenAddedChildNotEmpty() {
        appCoord.start()
        appCoord.profileButtonPressed()
        
        XCTAssert(appCoord.childCoordinators.count == 1)
    }
    
    func test_countriesScreenAddedChildrenNotEmpty() {
        appCoord.start()
        appCoord.dataButtonPressed()
        
        XCTAssertTrue(appCoord.childCoordinators.count == 1)
    }
    
    func test_navigateBackFromProfileScreenNoChildren() {
        appCoord.start()
        appCoord.profileButtonPressed()
    
        XCTAssertTrue(appCoord.childCoordinators.count == 1)
        
        appCoord.backPressed(coordinator: appCoord.childCoordinators[0])
        
        XCTAssertTrue(appCoord.childCoordinators.count == 0)
    }
    
    func test_navigateBackFromCountriesScreenNoChildren() {
        appCoord.start()
        appCoord.dataButtonPressed()
    
        XCTAssertTrue(appCoord.childCoordinators.count == 1)
        
        appCoord.backPressed(coordinator: appCoord.childCoordinators[0])
        
        XCTAssertTrue(appCoord.childCoordinators.count == 0)
    }
}
