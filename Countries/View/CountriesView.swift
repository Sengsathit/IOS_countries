//
//  CountriesView.swift
//  Countries
//
//  Created by Sengsathit on 19/04/2020.
//  Copyright © 2020 Sengsathit. All rights reserved.
//

import SwiftUI

struct CountriesView: View {
    
    @ObservedObject var countriesViewModel = CountriesViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                // Hack for ScrollView to be updated after fetching data :-(
                if !self.countriesViewModel.countries.isEmpty {
                    
                    ScrollView {
                        
                        ForEach(countriesViewModel.countries){ country in
                            NavigationLink(destination: CountryDetailsView(country: country), label: {
                                ItemCountryView(country: country)
                            })
                        }
                        
                    }
                } else {
                    Text("Please reload data")
                }
            }
            .navigationBarTitle("Countries")
            .navigationBarItems(trailing: Button(action: {
                self.countriesViewModel.fetchCountries()
            }, label: {
                Text("Reload data")
            }))
        }
    }
}

struct CountriesView_Previews: PreviewProvider {
    static var previews: some View {
        CountriesView()
    }
}
