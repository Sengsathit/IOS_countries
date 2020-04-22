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
                if countriesViewModel.isFavoritesLoading {
                    Loader()
                } else {
                    if !self.countriesViewModel.favorites.isEmpty {
                        List {
                            ForEach(countriesViewModel.favorites, id: \.id){ country in
                                NavigationLink(destination: DetailsView(country: country), label: {
                                    ItemCountry(country: country)
                                })
                            }.onDelete(perform: countriesViewModel.deleteFavorites)
                        }
                        
                    } else {
                        Text("No favorites")
                    }
                }
                
            }
            .navigationBarTitle("Favorites")
            .navigationBarItems(trailing: EditButton())
        }
        .onAppear() {
            self.countriesViewModel.loadFavorites()
        }
    }
    
    
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}
