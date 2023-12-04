//
//  CategoryHome.swift
//  Landmarks
//
//  Created by TE-Member on 01/12/2023.
//

import SwiftUI

struct CategoryHome: View {
    @Environment(ModelData.self) var modelData
    @State private var showingProfile = false
    var body: some View {
        NavigationSplitView{
            List {
//                modelData.features[0].image
//                    .resizable()
//                    .scaledToFill()
//                    .frame(height: 200)
//                    .clipped()
//                    .listRowInsets(EdgeInsets())
                
                PageView(pages: modelData.features.map{
                    FeatureCard(landmark: $0)
                })
                .aspectRatio(3/2,contentMode: .fit)
                .listRowInsets(EdgeInsets())
                
                ForEach(modelData.categories.keys.sorted(), id: \.self){ key in
                    CategoryRow(categoryName: key, items: modelData.categories[key]!)
                }
                .listRowInsets(EdgeInsets())
            }
            .listStyle(.inset)
            .navigationTitle("Featured")
            .toolbar{
                Button{
                    showingProfile.toggle()
                } label: {
                    Label("User Profile", systemImage: "person.crop.circle")
                }
            }
            .sheet(isPresented: $showingProfile){
                ProfileHost()
                    .environment(modelData)
            }
            
        } detail: {
            Text("Text select Landmark")
        }
    }
}

#Preview {
    CategoryHome()
        .environment(ModelData())
}
