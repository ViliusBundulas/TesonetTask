//
//  ContinentsListView.swift
//  TesonetTask
//
//  Created by Vilius Bundulas on 2021-09-13.
//

import SwiftUI

struct ContinentsListView: View {
    
    @StateObject var viewModel = ContinentsViewModel()
    
    var body: some View {
        if viewModel.isLoading {
            LoadingView()
        } else if viewModel.errorMessage != nil {
            ErrorView()
        } else {
            ContinentsList(continents: viewModel.europe)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContinentsListView()
    }
}
