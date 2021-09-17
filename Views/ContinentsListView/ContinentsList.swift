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
        
        ScrollView {
            LazyVStack {
                ForEach(ContinentName.allCases, id: \.rawValue) { continent in
                    ContinentCard(image: continent.rawValue, continentName: continent.rawValue)
                    DisclosureGroup("Show countries of \(continent.rawValue)") {
                        ForEach(continents.filter { $0.continentName == continent }) { country in
                            VStack {
                                CountriesListRow(countryName: country.shorterCountryName)
                            }
                        }
                    }.font(.headline)
                    .frame(maxWidth: 350)
                }
            }.navigationBarTitle("Continents")
        }
    }
    
    struct ContinentsListView_Previews: PreviewProvider {
        static var previews: some View {
            ContinentsList(continents: [Continent]())
        }
    }
}
