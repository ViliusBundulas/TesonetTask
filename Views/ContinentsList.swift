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
            ForEach(continents) { continent in
                Text(continent.shorterCountryName)
            }
        }
    }
}

struct ContinentsListView_Previews: PreviewProvider {
    static var previews: some View {
        ContinentsList(continents: [Continent]())
    }
}
