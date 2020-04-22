//
//  CountryRepositorympl.swift
//  Countries
//
//  Created by Sengsathit on 21/04/2020.
//  Copyright © 2020 Sengsathit. All rights reserved.
//

import Foundation
import Combine

class CountryRepositoryImpl: CountryRepository {

    let countryRemoteDataSource: CountryRemoteDataSource
    let countryLocalDataSource: CountryLocalDataSource
    
    init() {
        countryRemoteDataSource = CountryRemoteDataSourceImpl()
        countryLocalDataSource = CountryLocalDataSourceImpl()
    }
    
    func getCountries() -> AnyPublisher<[Country], Error> {
        return countryRemoteDataSource.getAllCountries()
    }
    
    func getFavorites() -> AnyPublisher<[Country], Error> {
        return countryLocalDataSource.fetchFavorites()
    }
    
    func addToFavorites(country: Country) -> AnyPublisher<Bool, Error> {
        return countryLocalDataSource.insertCountry(country: country)
    }
    
    func removeFromFavorites(country: Country) -> AnyPublisher<Bool, Error> {
        return countryLocalDataSource.deleteCountry(country: country)
    }
}
