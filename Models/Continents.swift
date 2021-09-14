//
//  Continents.swift
//  TesonetTask
//
//  Created by Vilius Bundulas on 2021-09-13.
//

import Foundation

typealias Continents = [Continent]

struct Continent: Codable, Identifiable {
    let id = UUID().uuidString
    let continentCode: ContinentCode
    let continentName: ContinentName
    let countryName: String
    let countryNumber: Int?
    let threeLetterCountryCode: String?
    let twoLetterCountryCode: String

    enum CodingKeys: String, CodingKey {
        case continentCode = "Continent_Code"
        case continentName = "Continent_Name"
        case countryName = "Country_Name"
        case countryNumber = "Country_Number"
        case threeLetterCountryCode = "Three_Letter_Country_Code"
        case twoLetterCountryCode = "Two_Letter_Country_Code"
    }
}

enum ContinentCode: String, Codable {
    case af = "AF"
    case an = "AN"
    case continentCodeAS = "AS"
    case eu = "EU"
    case na = "NA"
    case oc = "OC"
    case sa = "SA"
}

enum ContinentName: String, Codable, CaseIterable {
    case africa = "Africa"
    case antarctica = "Antarctica"
    case asia = "Asia"
    case europe = "Europe"
    case northAmerica = "North America"
    case oceania = "Oceania"
    case southAmerica = "South America"
}

extension Continent {
    
    var shorterCountryName: String {
        countryName.components(separatedBy: ",")[0]
    }
}
