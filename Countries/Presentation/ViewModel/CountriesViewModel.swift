//
//  CountriesViewModel.swift
//  Countries
//
//  Created by Sengsathit on 19/04/2020.
//  Copyright © 2020 Sengsathit. All rights reserved.
//

import Foundation
import SwiftUI
import CoreData
import Combine

class CountriesViewModel: ObservableObject {
    
    @Published var countries: [Country] = []
    @Published var favorites: [CountryEntity] = []
    @Published var isLoading: Bool = false
    @Published var message: String = "Please reload data"
    
    let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    let countryUseCase = GetCountriesUseCase()
    
    // Cancellable storage for countries Publisher
    private var countriesSubscriber: AnyCancellable?
    
    func loadCountries() {
        isLoading = true
        countriesSubscriber = countryUseCase.publisher.sink(receiveCompletion: { completion in
            
            switch completion {
            case .finished:
                break
            case .failure:
                self.message = "Something went wrong\nPlease try again"
                break
            }
            self.isLoading = false
            
        }, receiveValue: { countries in
            self.countries = countries
        })
    }
    
    func addCountryToFavorites(country: Country) {
        let countryEntity = CountryEntity(context: managedObjectContext)
        countryEntity.id = UUID()
        countryEntity.code = country.code
        countryEntity.name = country.name
        countryEntity.capital = country.capital
        countryEntity.flag = country.flag
        commitContext()
    }
    
    func loadFavorites() {
        let request : NSFetchRequest<CountryEntity> = CountryEntity.fetchRequest()
        do{
            favorites = try managedObjectContext.fetch(request)
        } catch {
            print("Error while fetching data from context : \(error)")
        }
        
    }
    
    func deleteFavorites(at offsets: IndexSet) {
        for index in offsets {
            let country = favorites[index]
            managedObjectContext.delete(country)
            commitContext()
            loadFavorites()
        }
    }
    
    private func commitContext() {
        do {
            try managedObjectContext.save()
        } catch {
            print("Error : \(error)")
        }
    }
    
}
