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
            NavigationLink(destination: ContinentsListView()) {
                Text("Start")
                    .frame(minWidth: 0, maxWidth: 300)
                    .padding()
                    .foregroundColor(.white)
                    .background(LinearGradient(gradient: Gradient(colors: [Color.black, Color.gray]), startPoint: .topLeading, endPoint: .topTrailing))
                    .cornerRadius(40)
                    .font(.title)
                    .shadow(color: .gray, radius: 5)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
