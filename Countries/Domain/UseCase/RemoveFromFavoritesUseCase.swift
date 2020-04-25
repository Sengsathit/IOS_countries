//
//  CountryUseCase.swift
//  Countries
//
//  Created by Sengsathit on 21/04/2020.
//  Copyright © 2020 Sengsathit. All rights reserved.
//

import Foundation
import Combine
import Resolver

class RemoveFromFavoritesUseCase {
    @Injected var countryRepository: CountryRepository
    
    func getPublisher(country: Country) -> AnyPublisher<Bool, CountryError> {
        return countryRepository.removeFromFavorites(country: country)
    }
}
