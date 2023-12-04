//
//  LandmarkList.swift
//  Landmarks
//
//  Created by TE-Member on 01/12/2023.
//

import SwiftUI

struct LandmarkList: View {
    @Environment(ModelData.self) var modelData
    @State private var showFavoriteOnly = false
    
    var filteredLandnarks : [Landmark] {
        modelData.landmarks.filter{
            landmark in (!showFavoriteOnly || landmark.isFavorite)
        }
    }
    var body: some View {
        NavigationSplitView {
            List {
                Toggle(isOn: $showFavoriteOnly){
                    Text("Favotites only")
                }
                ForEach(filteredLandnarks){
                    landmark in NavigationLink {
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
            .navigationTitle("Landmarks")
        } detail: {
            Text("Select a Landmark")
        }
    }
}

#Preview {
    LandmarkList()
        .environment(ModelData())
}
