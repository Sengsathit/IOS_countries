//
//  FavoritesViewModel.swift
//  Countries
//
//  Created by Sengsathit on 24/04/2020.
//  Copyright © 2020 Sengsathit. All rights reserved.
//

import Foundation
import Combine
import Resolver

class FavoritesViewModel: ObservableObject {
    
    @Published var favorites: [Country] = []
    @Published var isCountryInFavorites: Bool = false
    @Published var isFavoritesLoading: Bool = false

    @Injected var getCountryUseCase: GetCountryUseCase
    @Injected var getFavoritesUseCase: GetFavoritesUseCase
    @Injected var addToFavoritesUseCase: AddToFavoritesUseCase
    @Injected var removeFromFavoritesUseCase: RemoveFromFavoritesUseCase
    
    private var favoritesSubscriber: AnyCancellable?
    
    func getCountry(code: String) {
        favoritesSubscriber = getCountryUseCase.getPublisher(countryCode: code)
            .sink(receiveCompletion: { completion in
            }, receiveValue: { country in
                self.isCountryInFavorites = country != nil ? true : false
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
        favoritesSubscriber = addToFavoritesUseCase.getPublisher(country: country)
            .sink(receiveCompletion: { _ in
                // Do something when process is completed
            }, receiveValue: { _ in
                // Do something on receiving value
            })
    }
    
    func deleteFavorites(at offsets: IndexSet) {
        for index in offsets {
            let country = favorites[index]
            favorites.remove(at: index)
            favoritesSubscriber = removeFromFavoritesUseCase.getPublisher(country: country)
                .sink(receiveCompletion: { _ in
                    // Do something when process is completed
                }, receiveValue: { _ in
                    // Do something on receiving value
                })
        }
    }
    
}
