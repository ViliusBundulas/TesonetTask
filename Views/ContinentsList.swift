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
                Section(header: Text(continent.rawValue)) {
                    ForEach(continents.filter { $0.continentName == continent }) { country in
                        Text(country.shorterCountryName)
                    }
                }
            }
        }.listStyle(SidebarListStyle())
    }
    
    struct ContinentsListView_Previews: PreviewProvider {
        static var previews: some View {
            ContinentsList(continents: [Continent]())
        }
    }
}
