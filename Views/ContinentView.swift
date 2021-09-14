//
//  ContinentView.swift
//  TesonetTask
//
//  Created by Vilius Bundulas on 2021-09-14.
//

import SwiftUI

struct ContinentView: View {
    
    let isExpanded: Bool
    
    let continent: Continent
    
    var body: some View {
        HStack {
            content
            Spacer()
        }
        .contentShape(Rectangle())
    }
    
    private var content: some View {
        VStack(alignment: .leading) {
            Text(continent.shorterCountryName).font(.headline)
            
            if isExpanded {
                VStack(alignment: .leading) {
                    Text(continent.continentCode.rawValue)
                }
            }
        }
    }
}
