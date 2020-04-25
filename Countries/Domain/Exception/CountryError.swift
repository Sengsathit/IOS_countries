//
//  CountryError.swift
//  Countries
//
//  Created by Sengsathit on 25/04/2020.
//  Copyright © 2020 Sengsathit. All rights reserved.
//

import Foundation

enum CountryError: Error {
    case fetchFavoritesError
    case retrieveCountry
    case insertCountry
    case deleteCountry
}
