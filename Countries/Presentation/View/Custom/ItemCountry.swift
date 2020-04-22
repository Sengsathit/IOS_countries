//
//  ItemCountryView.swift
//  Countries
//
//  Created by Sengsathit on 19/04/2020.
//  Copyright © 2020 Sengsathit. All rights reserved.
//

import SwiftUI

struct ItemCountry: View {
    
    let country: Country
    
    var body: some View {
        HStack {
            UrlImage(urlString: country.flag, widthValue: 100, heightValue: 100)
            Text(country.name)
            Spacer()
        }.padding()
    }
}

struct ItemCountryView_Previews: PreviewProvider {
    static var previews: some View {
        ItemCountry(country: Country(code: "AFG", name: "Afghanistan", capital: "Kabul", flag: "https://raw.githubusercontent.com/Sengsathit/DataMock/master/countries/afg.png")).previewLayout(.sizeThatFits)
    }
}


struct TestImage: View {
    
    var body: some View {
        Image(systemName: "heart")
    }
}
