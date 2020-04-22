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
                
                if countriesViewModel.isCountriesLoading {
                    Loader()
                } else {
                    if !self.countriesViewModel.countries.isEmpty {
                        List {
                            ForEach(countriesViewModel.countries){ country in
                                NavigationLink(destination: DetailsView(country: country), label: {
                                    ItemCountry(country: country)
                                })
                            }
                        }
                    } else {
                        Text(countriesViewModel.message).multilineTextAlignment(.center)
                    }
                }
                
            }
            .navigationBarTitle("Countries")
            .navigationBarItems(trailing: Button(action: {
                self.countriesViewModel.loadCountries()
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
