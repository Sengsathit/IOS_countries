//
//  CountryDetailsView.swift
//  Countries
//
//  Created by Sengsathit on 19/04/2020.
//  Copyright © 2020 Sengsathit. All rights reserved.
//

import SwiftUI

struct DetailsView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var favoritesViewModel = FavoritesViewModel()
    
    let country: Country
    
    var body: some View {
        VStack {
            UrlImage(urlString: country.flag, widthValue: 200, heightValue: 200)
            Text(country.name).font(.headline)
            Text(country.capital)
            Spacer()
            
            if !favoritesViewModel.isCountryInFavorites {
                Button(action: {
                    self.favoritesViewModel.addCountryToFavorites(country: self.country)
                    self.presentationMode.wrappedValue.dismiss()
                }, label: {
                    Text("ADD TO FAVORITES").foregroundColor(.white)
                }).padding().background(Color.gray).cornerRadius(8)
                Spacer().frame(height:48)
            }
            
        }
        .navigationBarTitle(country.name)
        .onAppear(){
            self.favoritesViewModel.getCountry(code: self.country.code)
        }
    }
    
    
    
}

struct CountryDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(country: Country(code: "AFG", name: "Afghanistan", capital: "Kabul", flag: "https://raw.githubusercontent.com/Sengsathit/DataMock/master/countries/afg.png"))
    }
}
