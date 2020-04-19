//
//  CountriesViewModel.swift
//  Countries
//
//  Created by Sengsathit on 19/04/2020.
//  Copyright © 2020 Sengsathit. All rights reserved.
//

import Foundation

let countriesJson =  "https://raw.githubusercontent.com/Sengsathit/DataMock/master/countries/countries.json"

class CountriesViewModel: ObservableObject {
    
    @Published var countries : [Country] = []
    
    func fetchCountries() {
        
        guard let url = URL(string: countriesJson) else { return }
        
        URLSession.shared.dataTask(with: url) {(data, response, error) in
            
            DispatchQueue.main.async {
                self.countries =  try! JSONDecoder().decode([Country].self, from: data!)
                print("FETCHED COUNTRIES : \(self.countries)")
                /*
                 do {
                 self.countries =  try JSONDecoder().decode([Country].self, from: data!)
                 print("FETCHED COUNTRIES : \(self.countries)")
                 } catch {
                 self.countries = []
                 }
                 */
            }
            
        }.resume()
    }
}
