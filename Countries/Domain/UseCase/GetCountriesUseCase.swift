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

class GetCountriesUseCase {
    
    @Injected var countryRepository: CountryRepository
    
    var publisher: AnyPublisher<[Country], CountryError> {
        countryRepository.getRemoteCountries()
    }
}
