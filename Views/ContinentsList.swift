//
//  ContinentsListView.swift
//  TesonetTask
//
//  Created by Vilius Bundulas on 2021-09-14.
//

import SwiftUI

struct ContinentsList: View {
    
    let continents: [Continent]
    
    var body: some View {
        
        List {
            ForEach(ContinentName.allCases, id: \.rawValue) { continent in
                DisclosureGroup(continent.rawValue) {
                    ForEach(continents.filter { $0.continentName == continent }) { country in
                        Text(country.shorterCountryName)
                    }
                }
            }
        }.listStyle(InsetGroupedListStyle())
    }
    
    struct ContinentsListView_Previews: PreviewProvider {
        static var previews: some View {
            ContinentsList(continents: [Continent]())
        }
    }
}
