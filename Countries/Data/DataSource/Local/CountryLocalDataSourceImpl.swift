//
//  CountryDataSourceImpl.swift
//  Countries
//
//  Created by Sengsathit on 21/04/2020.
//  Copyright © 2020 Sengsathit. All rights reserved.
//

import SwiftUI
import Combine
import CoreData

class CountryLocalDataSourceImpl: CountryLocalDataSource {
    
    let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    public init(){}

    func getCountry(countryCode: String) -> AnyPublisher<Country?, Error> {
        return Future<Country?, Error> { promise in
            let fetchRequest : NSFetchRequest<CountryEntity> = CountryEntity.fetchRequest()
            fetchRequest.predicate = NSPredicate(format: "code = %@", countryCode)
            
            do{
                let fetchedCountry = try self.managedObjectContext.fetch(fetchRequest)
                if fetchedCountry.count > 0 {
                    return promise(.success(fetchedCountry[0].mapToCountry()))
                }
                return promise(.success(nil))
            } catch {
                print("Error while fetching data from context : \(error)")
                return promise(.failure(error))
            }
        }.eraseToAnyPublisher()
    }
    
    func fetchFavorites() -> AnyPublisher<[Country], Error> {
        return Future<[Country], Error> { promise in
            let request : NSFetchRequest<CountryEntity> = CountryEntity.fetchRequest()
            request.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
            
            do{
                let favorites = try self.managedObjectContext.fetch(request)
                return promise(.success(favorites.map{$0.mapToCountry()}))
            } catch {
                print("Error while fetching data from context : \(error)")
                return promise(.failure(error))
            }
        }.eraseToAnyPublisher()
    }
    
    func insertCountry(country: Country) -> AnyPublisher<Bool, Error> {
        return Future<Bool, Error> { promise in
            
            let countryEntity = CountryEntity(context: self.managedObjectContext)
            countryEntity.id = UUID()
            countryEntity.code = country.code
            countryEntity.name = country.name
            countryEntity.capital = country.capital
            countryEntity.flag = country.flag
            
            do {
                try self.managedObjectContext.save()
                return promise(.success(true))
            } catch {
                print("Error : \(error)")
                return promise(.failure(error))
            }

        }.eraseToAnyPublisher()
    }
    
    // TODO delete is OK but must be improved
    func deleteCountry(country: Country) -> AnyPublisher<Bool, Error> {
        return Future<Bool, Error> { promise in
            let fetchRequest : NSFetchRequest<CountryEntity> = CountryEntity.fetchRequest()
            fetchRequest.predicate = NSPredicate(format: "code = %@", country.code)
            let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest as! NSFetchRequest<NSFetchRequestResult>)
           
            do {
                try self.managedObjectContext.execute(deleteRequest)
                try self.managedObjectContext.save()
                return promise(.success(true))
            } catch {
                print("Error : \(error)")
                return promise(.failure(error))
            }

        }.eraseToAnyPublisher()
    }
    
}
