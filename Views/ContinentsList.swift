//
//  ContinentsListView.swift
//  TesonetTask
//
//  Created by Vilius Bundulas on 2021-09-14.
//

import SwiftUI

struct ContinentsList: View {
    
    @State private var location = "Africa"
    @State private var imageAnimation = false
    
    let continents: [Continent]
    
    var body: some View {
        
        VStack {
            Image(location)
                .resizable()
                .frame(width: 150, height: 150)
                .rotationEffect(.degrees(self.imageAnimation ? 360.0 : 0.0))
                .animation(self.imageAnimation ? Animation.linear(duration: 2.5).repeatForever(autoreverses: false) : nil)
            Spacer(minLength: 50)
            List {
                ForEach(ContinentName.allCases, id: \.rawValue) { continent in
                    Section {
                        DisclosureGroup(continent.rawValue) {
                            ForEach(continents.filter { $0.continentName == continent }) { country in
                                Text(country.shorterCountryName)
                            }
                        }
                    }
                    .contentShape(Rectangle())
                    .onTapGesture {
                        self.imageAnimation = true
                        self.location = continent.rawValue
                    }
                }
            }.listStyle(InsetGroupedListStyle())
        }
    }
    
    struct ContinentsListView_Previews: PreviewProvider {
        static var previews: some View {
            ContinentsList(continents: [Continent]())
        }
    }
}
