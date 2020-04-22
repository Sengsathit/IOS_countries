//
//  CountryEntity+CoreDataProperties.swift
//  Countries
//
//  Created by Sengsathit on 21/04/2020.
//  Copyright © 2020 Sengsathit. All rights reserved.
//
//

import Foundation
import CoreData


extension CountryEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CountryEntity> {
        return NSFetchRequest<CountryEntity>(entityName: "CountryEntity")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var code: String?
    @NSManaged public var name: String?
    @NSManaged public var capital: String?
    @NSManaged public var flag: String?

    
    var wrappedCode: String {
        code ?? "Unknown"
    }

    var wrappedName: String {
        name ?? "Unknown"
    }
    
    func mapToCountry() -> Country {
        return Country(code: code!, name: name!, capital: capital!, flag: flag!)
    }

}
