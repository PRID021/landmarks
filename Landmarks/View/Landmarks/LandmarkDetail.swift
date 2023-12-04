//
//  LandmarkDetail.swift
//  Landmarks
//
//  Created by TE-Member on 01/12/2023.
//

import SwiftUI

struct LandmarkDetail: View {
    @Environment(ModelData.self) var modelData
    let landmark: Landmark
    var landmarkIndex: Int {
        modelData.landmarks.firstIndex(where: {
            $0.id == landmark.id
        })!
    }
    var body: some View {
        @Bindable var modelData = modelData
        
        ScrollView{
            MapView(coordinate: landmark.locationCoordinate)
                .frame(height: 300)
            CircleImage(image: landmark.image)
                .offset(y: -130)
                .padding(.bottom,-130)
            VStack(alignment: .leading) {
                HStack {
                    Text(landmark.name)
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    FavoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
                }
                HStack {
                    Text(landmark.park)
                    
                    Spacer()
                    Text(landmark.state)
                    
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
                Divider()
                Text("About \(landmark.name)")
                    .font(.subheadline)
                Text(landmark.description)
            }.padding()
        }
        .navigationTitle(landmark.name)
        .navigationBarTitleDisplayMode(.automatic)
    
    }
}

#Preview {
    let modelData = ModelData()
    return LandmarkDetail(landmark: modelData.landmarks[0])
        .environment(modelData)
}
