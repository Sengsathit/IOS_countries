//
//  FavoritesViewModel.swift
//  Countries
//
//  Created by Sengsathit on 24/04/2020.
//  Copyright © 2020 Sengsathit. All rights reserved.
//

import Foundation
import Combine

class FavoritesViewModel: ObservableObject {
    
    @Published var favorites: [Country] = []
    @Published var isCountryInFavorites: Bool = false
    @Published var isFavoritesLoading: Bool = false

    let getCountryUseCase = GetCountryUseCase()
    let getFavoritesUseCase = GetFavoritesUseCase()
    let addToFavoritesUseCase = AddToFavoritesUseCase()
    let removeFromFavoritesUseCase = RemoveFromFavoritesUseCase()
    
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
    
    // TODO delete is OK but must be improved
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
