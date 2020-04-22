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
    func getCountries() -> AnyPublisher<[Country], Error>
    func getFavorites() -> AnyPublisher<[Country], Error>
    func addToFavorites(country: Country) -> AnyPublisher<Bool, Error>
    func removeFromFavorites(country: Country) -> AnyPublisher<Bool, Error>
}
