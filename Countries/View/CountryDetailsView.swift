//
//  CountryDetailsView.swift
//  Countries
//
//  Created by Sengsathit on 19/04/2020.
//  Copyright © 2020 Sengsathit. All rights reserved.
//

import SwiftUI

struct CountryDetailsView: View {
    
    let country: Country
    
    var body: some View {
        VStack {
            Text("Details")
        }.navigationBarTitle(country.name)
    }
}

struct CountryDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        CountryDetailsView(country: Country(alpha3Code: "AFG", name: "Afghanistan", capital: "Kabul", flagPNG: "https://raw.githubusercontent.com/Sengsathit/DataMock/master/countries/afg.png"))
    }
}
