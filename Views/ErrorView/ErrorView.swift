//
//  ErrorView.swift
//  TesonetTask
//
//  Created by Vilius Bundulas on 2021-09-14.
//

import SwiftUI

struct ErrorView: View {
    
    var errorMessage: String
    
    var body: some View {
        ZStack {
            Text(errorMessage)
        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(errorMessage: "Something wrong")
    }
}
