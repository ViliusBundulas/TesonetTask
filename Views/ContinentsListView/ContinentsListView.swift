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
            ErrorView(errorMessage: viewModel.errorMessage ?? "")
        } else {
            ContinentsList(continents: viewModel.continents)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContinentsListView()
    }
}
