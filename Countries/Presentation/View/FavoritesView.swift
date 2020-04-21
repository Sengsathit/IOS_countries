//
//  FavoritesView.swift
//  Countries
//
//  Created by Sengsathit on 19/04/2020.
//  Copyright © 2020 Sengsathit. All rights reserved.
//

import SwiftUI
import CoreData

struct FavoritesView: View {
    
    @ObservedObject var countriesViewModel = CountriesViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
//                DataFilteredList(filterKey: "name", filterValue: nameFilter){ (country: CountryEntity) in
//                    Text(country.name!)
//                }
                if !self.countriesViewModel.favorites.isEmpty {
                    List {
                        ForEach(countriesViewModel.favorites, id: \.id){ countryEntity in
                            NavigationLink(destination: DetailsView(country: countryEntity.mapToCountry()), label: {
                                ItemCountry(country: countryEntity.mapToCountry())
                            })
                        }.onDelete(perform: countriesViewModel.deleteFavorites)
                    }
                    
                } else {
                    Text("No favorites")
                }
            }.navigationBarTitle("Favorites")
            .navigationBarItems(trailing: EditButton())
        }.onAppear() {
            self.countriesViewModel.loadFavorites()
        }
    }
    
    
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}
