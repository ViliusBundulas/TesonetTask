//
//  EarthView.swift
//  TesonetTask
//
//  Created by Vilius Bundulas on 2021-09-17.
//

import SwiftUI
import SceneKit

struct EarthView: View {
    
    var body: some View {
        SceneView(scene: SCNScene(named: "Earth.usdz"), options: [.autoenablesDefaultLighting, .allowsCameraControl])
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2)
            .opacity(0.9)
    }
}

struct EarthView_Previews: PreviewProvider {
    static var previews: some View {
        EarthView()
    }
}
