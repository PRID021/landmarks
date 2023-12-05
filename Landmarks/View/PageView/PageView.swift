//
//  PageView.swift
//  Landmarks
//
//  Created by TE-Member on 04/12/2023.
//

import SwiftUI

struct PageView<Page: View>: View {
    var pages: [Page]
    @State private var currentPage = 2
    
    var body: some View {
        ZStack (alignment: .bottomTrailing){
            PageViewController(pages: pages, currentPage: $currentPage)
            PageControl(numberOfPages:  pages.count, currentPage: $currentPage)
                .frame(width: CGFloat(pages.count * 18))
                .padding(.trailing)
        }
    }
}

#Preview {
    PageView(pages: ModelData().features.map {
        FeatureCard(landmark: $0)
    }).aspectRatio(/*@START_MENU_TOKEN@*/1.5/*@END_MENU_TOKEN@*/, contentMode: .fit)
}
