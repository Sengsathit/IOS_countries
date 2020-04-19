//
//  ItemCountryView.swift
//  Countries
//
//  Created by Sengsathit on 19/04/2020.
//  Copyright © 2020 Sengsathit. All rights reserved.
//

import SwiftUI

struct ItemCountryView: View {
    
    let country: Country
    
    var body: some View {
        HStack {
            Text(country.name)
            Spacer()
        }.padding()
    }
}

struct ItemCountryView_Previews: PreviewProvider {
    static var previews: some View {
        ItemCountryView(country: Country(alpha3Code: "AFG", name: "Afghanistan", capital: "Kabul", flagPNG: "https://raw.githubusercontent.com/Sengsathit/DataMock/master/countries/afg.png")).previewLayout(.sizeThatFits)
    }
}
