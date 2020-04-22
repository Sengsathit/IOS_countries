//
//  ContentView.swift
//  Countries
//
//  Created by Sengsathit on 19/04/2020.
//  Copyright © 2020 Sengsathit. All rights reserved.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        
        TabView {
            CountriesView()
                .tabItem {
                    Image(systemName: "globe")
                    Text("Countries")
            }
            FavoritesView()
                .tabItem {
                    Image(systemName: "heart.fill")
                    Text("Favorites")
            }
        }.onAppear(){
            #if DEBUG
            // Prints path to app directory, we can also check the local DB there
            print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))
            #endif
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
