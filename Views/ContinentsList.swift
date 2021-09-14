//
//  ContinentsListView.swift
//  TesonetTask
//
//  Created by Vilius Bundulas on 2021-09-14.
//

import SwiftUI

struct ContinentsList: View {
    
    let continents: [Continent]
    
    @State private var selection: Set<Continent> = []
    @State private var expand: Bool = false
    
    var body: some View {
        
        List {
            ForEach(ContinentName.allCases, id: \.rawValue) { continent in
                Section(header: Text(continent.rawValue)) {
                    ForEach(continents.filter { $0.continentName == continent }) { country in
                        ContinentView(isExpanded: self.selection.contains(country), continent: country).onTapGesture {
                            self.selectDeselect(country)
                        }
                        .animation(.linear(duration: 0.3))
                    }
                }
            }
        }
        
//        List(continents) { continent in
//            ContinentView(isExpanded: self.selection.contains(continent), continent: continent).onTapGesture {
//                self.selectDeselect(continent)
//            }
//            .animation(.linear(duration: 0.3))
//        }
    }
    
    private func selectDeselect(_ continent: Continent) {
            if selection.contains(continent) {
                selection.remove(continent)
            } else {
                selection.insert(continent)
            }
        }
}

struct ContinentsListView_Previews: PreviewProvider {
    static var previews: some View {
        ContinentsList(continents: [Continent]())
    }
}
