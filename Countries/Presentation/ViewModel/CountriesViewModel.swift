//
//  CountriesViewModel.swift
//  Countries
//
//  Created by Sengsathit on 19/04/2020.
//  Copyright © 2020 Sengsathit. All rights reserved.
//

import SwiftUI
import Combine

class CountriesViewModel: ObservableObject {
    
    @Published var countries: [Country] = []
    @Published var favorites: [Country] = []
    @Published var isCountriesLoading: Bool = false
    @Published var isFavoritesLoading: Bool = false
    @Published var message: String = "Please reload data"
    
    let getCoutriesUseCase = GetCountriesUseCase()
    let getFavoritesUseCase = GetFavoritesUseCase()
    let addToFavoritesUseCase = AddToFavoritesUseCase()
    let removeFromFavoritesUseCase = RemoveFromFavoritesUseCase()
    
    // Cancellable storage for countries Publisher
    private var countriesSubscriber: AnyCancellable?
    private var favoritesSubscriber: AnyCancellable?
    
    func loadCountries() {
        isCountriesLoading = true
        countriesSubscriber = getCoutriesUseCase.publisher
            .delay(for: .seconds(2), scheduler: DispatchQueue.main) //TODO : remove delay, it's just for simulate latency
            .sink(receiveCompletion: { completion in
                
                switch completion {
                case .finished:
                    break
                case .failure:
                    self.message = "Something went wrong\nPlease try again"
                    break
                }
                self.isCountriesLoading = false
                
            }, receiveValue: { countries in
                self.countries = countries
            })
    }
    
    func loadFavorites() {
        isFavoritesLoading = true
        favoritesSubscriber = getFavoritesUseCase.publisher
            .sink(receiveCompletion: { completion in
                self.isFavoritesLoading = false
                
            }, receiveValue: { countries in
                self.favorites = countries
            })
    }
    
    func addCountryToFavorites(country: Country) {
        favoritesSubscriber = addToFavoritesUseCase.getPublisher(country: country).sink(receiveCompletion: { _ in
            
        }, receiveValue: { _ in
            
        })
    }
    
    // TODO delete is OK but must be improved
    func deleteFavorites(at offsets: IndexSet) {
        for index in offsets {
            let country = favorites[index]
            favoritesSubscriber = removeFromFavoritesUseCase.getPublisher(country: country)
                .sink(receiveCompletion: { _ in
                    
                }, receiveValue: { _ in
                    self.loadFavorites()
                })
        }
    }
    
}
