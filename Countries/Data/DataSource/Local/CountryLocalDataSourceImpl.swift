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
    
    func getCountry(countryCode: String) throws -> CountryEntity? {
        let fetchRequest : NSFetchRequest<CountryEntity> = CountryEntity.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "code = %@", countryCode)
        
        do{
            let fetchedCountry = try self.managedObjectContext.fetch(fetchRequest)
            return fetchedCountry.count > 0 ? fetchedCountry[0] : nil
        } catch {
            print("Error while fetching data from context : \(error)")
            throw(error)
        }
    }
    
    func fetchFavorites() throws -> [CountryEntity] {
        let request : NSFetchRequest<CountryEntity> = CountryEntity.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
        
        do{
            return try self.managedObjectContext.fetch(request)
        } catch {
            print("Error while fetching data from context : \(error)")
            throw(error)
        }
    }
    
    func insertCountry(country: Country) throws {
        let countryEntity = CountryEntity(context: self.managedObjectContext)
        countryEntity.id = UUID()
        countryEntity.code = country.code
        countryEntity.name = country.name
        countryEntity.capital = country.capital
        countryEntity.flag = country.flag
        do{
            try self.managedObjectContext.save()
        } catch {
            print("Error while fetching data from context : \(error)")
            throw(error)
        }
        
    }
    
    func deleteCountry(country: Country) throws {
        let fetchRequest : NSFetchRequest<CountryEntity> = CountryEntity.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "code = %@", country.code)
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest as! NSFetchRequest<NSFetchRequestResult>)
        
        do{
            try self.managedObjectContext.execute(deleteRequest)
            try self.managedObjectContext.save()
        } catch {
            print("Error while fetching data from context : \(error)")
            throw(error)
        }
        
    }
    
}
