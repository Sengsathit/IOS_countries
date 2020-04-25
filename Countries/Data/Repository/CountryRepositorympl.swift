//
//  CountryRepositorympl.swift
//  Countries
//
//  Created by Sengsathit on 21/04/2020.
//  Copyright © 2020 Sengsathit. All rights reserved.
//

import Foundation
import Combine

class CountryRepositoryImpl: CountryRepository {    
    
    let countryRemoteDataSource: CountryRemoteDataSource
    let countryLocalDataSource: CountryLocalDataSource
    
    init() {
        countryRemoteDataSource = CountryRemoteDataSourceImpl()
        countryLocalDataSource = CountryLocalDataSourceImpl()
    }
    
    func getCountry(countryCode: String) -> AnyPublisher<Country?, CountryError> {
        
        return Future<Country?, CountryError> { promise in
            
            do{
                // Fetches countries locally
                let countryEntity = try self.countryLocalDataSource.getCountry(countryCode: countryCode)
                // Returns the country
                return promise(.success(countryEntity?.mapToCountry()))
            } catch {
                // Do something with the exception, maybe log it in a remote analytics sytem as Logstash, ElasticSearch or wathever
                //...
                // here the code using a LogRepository for example
                //...
                
                // Returns a custom error
                return promise(.failure(CountryError.retrieveCountry))
            }
        }.eraseToAnyPublisher()
    }
    
    
    func getFavorites() -> AnyPublisher<[Country], CountryError> {
        return Future<[Country], CountryError> { promise in
            
            do {
                // Fetches favorites locally
                let favorites = try self.countryLocalDataSource.fetchFavorites()
                // Returns the favorites
                return promise(.success(favorites.map{$0.mapToCountry()}))
            } catch {
                // Do something with the exception, maybe log it in a remote analytics sytem as Logstash, ElasticSearch or wathever
                //...
                // here the code using a LogRepository for example
                //...
                
                // Returns a custom error
                return promise(.failure(CountryError.fetchFavoritesError))
            }
            
        }.eraseToAnyPublisher()
    }
    
    func addToFavorites(country: Country) -> AnyPublisher<Bool, CountryError> {
        return Future<Bool, CountryError> { promise in
            
            do {
                // Inserts country
                try self.countryLocalDataSource.insertCountry(country: country)
                // Notifies success of the insertion process
                return promise(.success(true))
            } catch {
                // Do something with the exception, maybe log it in a remote analytics sytem as Logstash, ElasticSearch or wathever
                //...
                // here the code using a LogRepository for example
                //...
                
                // Returns a custom error
                return promise(.failure(CountryError.insertCountry))
            }
            
        }.eraseToAnyPublisher()
    }
    
    func removeFromFavorites(country: Country) -> AnyPublisher<Bool, CountryError> {
        
        return Future<Bool, CountryError> { promise in
    
            do {
                // Removes country from favorites
                try self.countryLocalDataSource.deleteCountry(country: country)
                // Notifies success of the remove process
                return promise(.success(true))
            } catch {
                // Do something with the exception, maybe log it in a remote analytics sytem as Logstash, ElasticSearch or wathever
                //...
                // here the code using a LogRepository for example
                //...
                
                // Returns a custom error
                return promise(.failure(CountryError.insertCountry))
            }
            
        }.eraseToAnyPublisher()
    }
    
    func getRemoteCountries() -> AnyPublisher<[Country], CountryError> {
        return countryRemoteDataSource.getAllCountries()
    }
}
