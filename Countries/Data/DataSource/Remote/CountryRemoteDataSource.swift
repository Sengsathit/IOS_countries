//
//  CountryDataSource.swift
//  Countries
//
//  Created by Sengsathit on 21/04/2020.
//  Copyright © 2020 Sengsathit. All rights reserved.
//

import Foundation
import Combine

protocol CountryRemoteDataSource {
    func getAllCountries() -> AnyPublisher<[Country], Error>
}
