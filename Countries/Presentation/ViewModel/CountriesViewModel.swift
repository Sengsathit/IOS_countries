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
    @Published var isCountriesLoading: Bool = false
    @Published var message: String = "Please reload data"
    
    let getCoutriesUseCase = GetCountriesUseCase()
    
    // Cancellable storage for countries Publisher
    private var countriesSubscriber: AnyCancellable?
    
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

}
