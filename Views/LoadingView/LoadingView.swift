//
//  LoadingView.swift
//  TesonetTask
//
//  Created by Vilius Bundulas on 2021-09-14.
//

import SwiftUI

struct LoadingView: View {
    
    var body: some View {
        VStack {
            ProgressView()
            Text("Loading")
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
