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
    func fetchFavorites() -> AnyPublisher<[Country], Error>
    func getCountry(countryCode: String) -> AnyPublisher<Country?, Error>
    func insertCountry(country: Country) -> AnyPublisher<Bool, Error>
    func deleteCountry(country: Country) -> AnyPublisher<Bool, Error>
}
