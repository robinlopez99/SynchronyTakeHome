//
//  CountriesServiceTests.swift
//  SynchronyProjectTests
//
//  Created by Robin Lopez Ordonez on 1/25/21.
//

import XCTest
@testable import SynchronyProject

class CountriesServiceTests: XCTestCase {
    
    var countryService = CountriesService()
    
    func test_urlString() {
        let myURL = URL(string: "https://restcountries.eu/rest/v2/all")!
        XCTAssertEqual(myURL, countryService.url)
    }
    
    func test_getCountriesShouldNotReturnEmpty() {
        let data = countryService.getCountries()
        XCTAssertTrue(data.count != 0)
    }
}
