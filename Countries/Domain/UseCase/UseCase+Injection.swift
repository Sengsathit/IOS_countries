//
//  UseCase+Injection.swift
//  Countries
//
//  Created by Sengsathit on 25/04/2020.
//  Copyright © 2020 Sengsathit. All rights reserved.
//

import Foundation
import Resolver

// Registration of all UseCase dependencies
extension Resolver {
    public static func registerUseCases() {
        register{ GetFavoritesUseCase() }
        register{ RemoveFromFavoritesUseCase() }
        register{ AddToFavoritesUseCase() }
        register{ GetCountriesUseCase() }
        register{ GetCountryUseCase() }
    }
}
