//
//  DataSource+Injection.swift
//  Countries
//
//  Created by Sengsathit on 25/04/2020.
//  Copyright © 2020 Sengsathit. All rights reserved.
//

import Foundation
import Resolver

// Registration of all dependencies from DataSources
extension Resolver {
    public static func registerDataSources() {
        
        register{
            CountryRemoteDataSourceImpl()
        }.implements(CountryRemoteDataSource.self)
        
        register{
            CountryLocalDataSourceImpl()
        }.implements(CountryLocalDataSource.self)
    }
}
