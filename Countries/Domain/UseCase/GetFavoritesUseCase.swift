//
//  CountryUseCase.swift
//  Countries
//
//  Created by Sengsathit on 21/04/2020.
//  Copyright © 2020 Sengsathit. All rights reserved.
//

import Foundation
import Combine

class GetFavoritesUseCase {
    let countryRepository: CountryRepository
    
    init() {
        countryRepository = CountryRepositoryImpl()
    }
    
    var publisher: AnyPublisher<[Country], CountryError> {
        countryRepository.getFavorites()
    }
}
