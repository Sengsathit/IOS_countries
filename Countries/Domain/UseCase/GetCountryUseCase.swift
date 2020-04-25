//
//  IsFavoriteUseCase.swift
//  Countries
//
//  Created by Sengsathit on 24/04/2020.
//  Copyright © 2020 Sengsathit. All rights reserved.
//

import Foundation
import Combine
import Resolver

class GetCountryUseCase {
    @Injected var countryRepository: CountryRepository
    
    func getPublisher(countryCode: String) -> AnyPublisher<Country?, CountryError> {
        return countryRepository.getCountry(countryCode: countryCode)
    }
}
