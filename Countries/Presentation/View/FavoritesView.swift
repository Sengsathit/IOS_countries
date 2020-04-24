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
    
    @ObservedObject var favoritesViewModel = FavoritesViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                if favoritesViewModel.isFavoritesLoading {
                    Loader()
                } else {
                    if !self.favoritesViewModel.favorites.isEmpty {
                        List {
                            ForEach(favoritesViewModel.favorites, id: \.id){ country in
                                NavigationLink(destination: DetailsView(country: country), label: {
                                    ItemCountry(country: country)
                                })
                            }.onDelete(perform: favoritesViewModel.deleteFavorites)
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
            self.favoritesViewModel.loadFavorites()
        }
    }
    
    
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}
