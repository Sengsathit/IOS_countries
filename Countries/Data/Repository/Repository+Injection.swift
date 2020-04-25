//
//  Repository+Injection.swift
//  Countries
//
//  Created by Sengsathit on 25/04/2020.
//  Copyright © 2020 Sengsathit. All rights reserved.
//
import Foundation
import Resolver

// Registration of all dependencies from Repositories
extension Resolver {
    public static func registerRepositories() {
        register{
            CountryRepositoryImpl()
        }.implements(CountryRepository.self)
    }
}
