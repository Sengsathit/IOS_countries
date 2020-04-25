//
//  AppDelegate+Injection.swift
//  Countries
//
//  Created by Sengsathit on 25/04/2020.
//  Copyright © 2020 Sengsathit. All rights reserved.
//

import Foundation
import Resolver

// Referencing all dependencies
extension Resolver: ResolverRegistering {
    public static func registerAllServices() {
        // Registers dependencies from DataSources
        registerDataSources()
        
        // Registers dependencies from Repositories
        registerRepositories()
        
        // Registers dependencies from UseCases
        registerUseCases()
    }
}
