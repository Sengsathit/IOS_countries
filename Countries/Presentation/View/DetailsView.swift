//
//  CountryDetailsView.swift
//  Countries
//
//  Created by Sengsathit on 19/04/2020.
//  Copyright © 2020 Sengsathit. All rights reserved.
//

import SwiftUI

struct DetailsView: View {
        
    @ObservedObject var countriesViewModel = CountriesViewModel()
    
    let country: Country
    
    var body: some View {
        VStack {
            UrlImage(urlString: country.flag, widthValue: 200, heightValue: 200)
            Text(country.name).font(.headline)
            Text(country.capital)
            Spacer()
            Button(action: {
                self.countriesViewModel.addCountryToFavorites(country: self.country)
            }, label: {
                Text("ADD TO FAVORITES").foregroundColor(.white)
            }).padding().background(Color.gray).cornerRadius(8)
            Spacer().frame(height:48)
            
        }.navigationBarTitle(country.name)
    }
    
    
    
}

struct CountryDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(country: Country(code: "AFG", name: "Afghanistan", capital: "Kabul", flag: "https://raw.githubusercontent.com/Sengsathit/DataMock/master/countries/afg.png"))
    }
}
