//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by TE-Member on 30/11/2023.
//

import SwiftUI

@main
struct LandmarksApp: App {
    @State private var modelData = ModelData()
    var body: some Scene {
        WindowGroup {
            ContentView().environment(modelData)
        }
    }
}
