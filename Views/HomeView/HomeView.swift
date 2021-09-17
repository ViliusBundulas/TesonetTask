//
//  HomeView.swift
//  TesonetTask
//
//  Created by Vilius Bundulas on 2021-09-14.
//

import SwiftUI

struct HomeView: View {
    
    var body: some View {
        
        NavigationView {
            VStack {
                Text("Explore the World")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                EarthView()
                Spacer()
                NavigationLink(destination: ContinentsListView()) {
                    StartButton()
                }
                Spacer()
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
