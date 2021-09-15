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
                    .frame(width: 100, height: 100)
                    .rotation3DEffect(self.imageAnimation ? Angle(degrees: 360): Angle(degrees: 0), axis: (x: 0.0, y: 360.0, z: 0.0))
                    .opacity(fadeOut ? 0 : 1)
                    .animation(.easeInOut(duration: 0.5))
                Spacer(minLength: 30)
                Text("Continents")
                    .font(.title)
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
                            if self.location != continent.rawValue {
//                                self.imageAnimation.toggle()
                                self.fadeOut.toggle()
                                
                                
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                    withAnimation {
                                        
                                        self.location = continent.rawValue
    //                                    self.imageAnimation.toggle()
                                        self.fadeOut.toggle()
                                    }
                                }
                            }
                        }
                    }
                }.listStyle(PlainListStyle())
            }
    }
    
    struct ContinentsListView_Previews: PreviewProvider {
        static var previews: some View {
            ContinentsList(continents: [Continent]())
        }
    }
}
