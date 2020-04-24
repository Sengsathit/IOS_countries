//
//  CountryUseCase.swift
//  Countries
//
//  Created by Sengsathit on 21/04/2020.
//  Copyright © 2020 Sengsathit. All rights reserved.
//

import Foundation
import Combine

class RemoveFromFavoritesUseCase {
    let countryRepository: CountryRepository
    
    init() {
        countryRepository = CountryRepositoryImpl()
    }
    
    func getPublisher(country: Country) -> AnyPublisher<Bool, Error> {
        return countryRepository.removeFromFavorites(country: country)
    }
}