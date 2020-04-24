//
//  CountryResponse.swift
//  Countries
//
//  Created by Sengsathit on 22/04/2020.
//  Copyright © 2020 Sengsathit. All rights reserved.
//

import Foundation

struct CountryResponse: Decodable {
    let alpha2Code: String?
    let alpha3Code: String?
    let altSpellings: [String]?
    let area: Double?
    let borders: [String]?
    let callingCodes: [String]?
    let capital: String?
    let cioc: String?
    let currencies: [Currency]?
    let demonym: String?
    let flagPNG: String?
    let gini: Double?
    let languages: [Language]?
    let latlng: [Double]?
    let name: String?
    let nativeName: String?
    let numericCode: String?
    let population: Int?
    let region: String?
    let regionalBlocs: [RegionalBloc]?
    let subregion: String?
    let timezones: [String]?
    let topLevelDomain: [String]?
    let translations: Translations?
}

struct Currency: Decodable{
    let code: String?
    let name: String?
    let symbol: String?
}

struct Language: Decodable{
    let iso6391: String?
    let iso6392: String?
    let name: String?
    let nativeName: String?
}

struct RegionalBloc: Decodable{
    let acronym: String?
    let name: String?
}

struct Translations: Decodable {
    let br: String?
    let de: String?
    let es: String?
    let fa: String?
    let fr: String?
    let hr: String?
    let it: String?
    let ja: String?
    let nl: String?
    let pt: String?
}

extension CountryResponse {
    func mapToCountry() -> Country {
        return Country(code: alpha3Code!, name: name!, capital: capital!, flag: flagPNG!)
    }
}
