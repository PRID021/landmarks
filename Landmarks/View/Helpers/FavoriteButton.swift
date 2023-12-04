//
//  FavoriteButton.swift
//  Landmarks
//
//  Created by TE-Member on 01/12/2023.
//

import SwiftUI

struct FavoriteButton: View {
    @Binding var isSet: Bool
    var body: some View {
        Button{
            isSet.toggle()
        }label: {
            Label("Toogle Favorite",
                  systemImage: isSet ? "star.fill":"star")
            .labelStyle(.iconOnly)
            .foregroundStyle(isSet ? .yellow : .gray)
        }
    }
}

#Preview {
    FavoriteButton(isSet: .constant(true))
}
