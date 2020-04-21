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
    
    let countryRemoteDataSource: CountryDataSource
    
    init() {
        countryRemoteDataSource = CountryRemoteDataSource()
    }
    
    func getCountries() -> AnyPublisher<[Country], Error> {
        return countryRemoteDataSource.getAllCountries()
    }
    
}
