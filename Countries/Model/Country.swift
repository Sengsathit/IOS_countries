//
//  Country.swift
//  Countries
//
//  Created by Sengsathit on 19/04/2020.
//  Copyright © 2020 Sengsathit. All rights reserved.
//

import Foundation

struct Country: Identifiable, Decodable {
    let id = UUID()
    let alpha3Code: String
    let name: String
    let capital: String
    let flagPNG: String
}
