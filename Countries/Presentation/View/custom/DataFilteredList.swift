//
//  FilteredList.swift
//  Countries
//
//  Created by Sengsathit on 21/04/2020.
//  Copyright © 2020 Sengsathit. All rights reserved.
//

import SwiftUI
import CoreData


// Custom view that dynamically filters @FetchRequest
struct DataFilteredList<T: NSManagedObject, Content: View>: View {
    
    var fetchRequest: FetchRequest<T>
    
    var items: FetchedResults<T> { fetchRequest.wrappedValue }

    // This is our content closure; we'll call this once for each item in the list
    let content: (T) -> Content

    var body: some View {
        List(fetchRequest.wrappedValue, id: \.self) { item in
            self.content(item)
        }
    }

    init(filterKey: String, filterValue: String, @ViewBuilder content: @escaping (T) -> Content) {
        fetchRequest = FetchRequest<T>(entity: T.entity(),
                                       sortDescriptors: [],
                                       predicate: NSPredicate(format: "%K CONTAINS[cd] %@", filterKey, filterValue))
        self.content = content
    }
}

//struct FilteredList_Previews: PreviewProvider {
//    static var previews: some View {
//        DataFilteredList()
//    }
//}
