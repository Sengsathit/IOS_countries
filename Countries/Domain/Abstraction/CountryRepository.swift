//
//  CountryRepository.swift
//  Countries
//
//  Created by Sengsathit on 21/04/2020.
//  Copyright © 2020 Sengsathit. All rights reserved.
//

import Foundation
import Combine

protocol CountryRepository {
    func getCountry(countryCode: String) -> AnyPublisher<Country?, CountryError>
    func getRemoteCountries() -> AnyPublisher<[Country], Error>
    func getFavorites() -> AnyPublisher<[Country], CountryError>
    func addToFavorites(country: Country) -> AnyPublisher<Bool, CountryError>
    func removeFromFavorites(country: Country) -> AnyPublisher<Bool, CountryError>
}
