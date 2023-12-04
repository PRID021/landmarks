//
//  CategoryItem.swift
//  Landmarks
//
//  Created by TE-Member on 01/12/2023.
//

import SwiftUI

struct CategoryItem: View {
    var landmark: Landmark
    var body: some View {
        VStack(alignment: .leading){
            landmark.image
                .renderingMode(.original)
                .resizable()
                .frame(width: 155, height: 155)
                .cornerRadius(5)
            Text(landmark.name)
                .foregroundStyle(.primary)
                .font(.caption)
        }
        .padding(.leading,15)
        
    }
}


#Preview {
    let landmarks = ModelData().landmarks
    return CategoryItem(landmark: landmarks[0])
}
