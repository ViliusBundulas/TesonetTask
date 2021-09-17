//
//  CustomListRow.swift
//  TesonetTask
//
//  Created by Vilius Bundulas on 2021-09-17.
//

import SwiftUI

struct CountriesListRow: View {
    
    var countryName: String
    
    var body: some View {
        VStack {
            Text(countryName)
                .font(.body)
                .padding(5)
                .frame(maxWidth: .infinity, alignment: .leading)
            Divider()
        }
    }
}

struct CustomListRow_Previews: PreviewProvider {
    static var previews: some View {
        CountriesListRow(countryName: "Lithuania")
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
    }
}
