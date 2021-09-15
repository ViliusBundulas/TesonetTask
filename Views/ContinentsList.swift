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
    @State private var fadeOut = false
    
    let continents: [Continent]
    
    var body: some View {
        
        VStack {
            Image(location)
                .resizable()
                .frame(width: 150, height: 150)
                .rotationEffect(.degrees(self.imageAnimation ? 360.0 : 0.0))
                .animation(self.imageAnimation ? Animation.linear(duration: 2.5).repeatForever(autoreverses: false) : nil)
                .opacity(fadeOut ? 0 : 1)
                .animation(.easeInOut(duration: 0.5))
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
                        self.imageAnimation.toggle()
                        self.fadeOut.toggle()
                        
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                            withAnimation {
                                self.location = continent.rawValue
                                self.fadeOut.toggle()
                                self.imageAnimation.toggle()
                            }
                        }
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
