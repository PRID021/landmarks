//
//  ContentView.swift
//  Landmarks
//
//  Created by TE-Member on 30/11/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var selection: Tab = .featured
    
    enum Tab{
        case featured
        case list
    }
    
    var body: some View {
        TabView(selection: $selection) {
            
            CategoryHome()
                .tabItem {
                    Label("Feature", systemImage: "star")
                }
                .tag (
                    Tab.featured
                )
            LandmarkList()
                .tabItem {
                    Label("List", systemImage: "list.bullet")
                }
                .tag (
                    Tab.list
            )
        }
    }
}

#Preview {
    ContentView().environment(ModelData())
}
