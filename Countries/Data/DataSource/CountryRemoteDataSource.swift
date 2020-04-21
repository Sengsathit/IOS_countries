//
//  CountryDataSourceImpl.swift
//  Countries
//
//  Created by Sengsathit on 21/04/2020.
//  Copyright © 2020 Sengsathit. All rights reserved.
//

import Foundation
import Combine

struct CountryRemoteDataSource: CountryDataSource {
    
    let countriesJsonUrl =  "https://raw.githubusercontent.com/Sengsathit/DataMock/master/countries/countries.json"
    
    public init(){}
        
    public func getAllCountries() -> AnyPublisher<[Country], Error> {
        let url = URL(string: countriesJsonUrl)!
        return URLSession.shared.dataTaskPublisher(for: url)
            .map{$0.data}
            .decode(type: [Country].self, decoder: JSONDecoder())
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
}
