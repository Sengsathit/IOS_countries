//
//  Country.swift
//  Countries
//
//  Created by Sengsathit on 19/04/2020.
//  Copyright © 2020 Sengsathit. All rights reserved.
//

import Foundation

struct Country: Identifiable, Codable {
    let id = UUID()
    let code: String
    let name: String
    let capital: String
    let flag: String

    private enum CodingKeys : String, CodingKey {
        case id, code = "alpha3Code", name, capital, flag = "flagPNG"
    }
}
