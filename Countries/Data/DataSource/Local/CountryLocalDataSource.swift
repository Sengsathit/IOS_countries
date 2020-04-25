//
//  CountryDataSource.swift
//  Countries
//
//  Created by Sengsathit on 21/04/2020.
//  Copyright © 2020 Sengsathit. All rights reserved.
//

import Foundation
import Combine

protocol CountryLocalDataSource {
    func fetchFavorites() throws -> [CountryEntity]
    func getCountry(countryCode: String) throws -> CountryEntity?
    func insertCountry(country: Country) throws
    func deleteCountry(country: Country) throws
}
