//
//  IsFavoriteUseCase.swift
//  Countries
//
//  Created by Sengsathit on 24/04/2020.
//  Copyright © 2020 Sengsathit. All rights reserved.
//

import Foundation
import Combine

class GetCountryUseCase {
    let countryRepository: CountryRepository
    
    init() {
        countryRepository = CountryRepositoryImpl()
    }
    
    func getPublisher(countryCode: String) -> AnyPublisher<Country, Error> {
        return countryRepository.getCountry(countryCode: countryCode)
    }
}
