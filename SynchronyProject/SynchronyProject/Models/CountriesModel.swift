//
//  CountriesModel.swift
//  SynchronyProject
//
//  Created by Robin Lopez Ordonez on 1/23/21.
//

import Foundation

struct CountriesModel: Codable {
    let name: String
    let topLevelDomain: [String]
    let alpha2Code: String
    let alpha3Code: String
    let callingCodes: [String]
    let capital: String
    let altSpellings: [String]
    let region: String
    let subregion: String
    let population: Int
    let latlng: [Float]
    let demonym: String?
    let area: Float?
    let gini: Float?
    let timezones: [String]
    let borders: [String]
    let nativeName: String
    let numericCode: String?
    let currencies: [Currency]
    let languages: [Language]
    let translations: Dictionary<String, String?>
    let flag: String
    let regionalBlocs: [RegionalBloc]
    let cioc: String?
}

struct RegionalBloc: Codable {
    let acronym: String
    let name: String
    let otherAcronyms: [String]?
    let otherNames: [String]?
}

struct Language: Codable {
    let iso639_1: String?
    let iso639_2: String
    let name: String
    let nativeName: String
}

struct Currency: Codable {
    let code: String?
    let name: String?
    let symbol: String?
}
