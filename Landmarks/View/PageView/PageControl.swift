//
//  PageController.swift
//  Landmarks
//
//  Created by TE-Member on 04/12/2023.
//

import SwiftUI
import UIKit


struct PageControl: UIViewRepresentable {
    func makeCoordinator() -> Coordinator {
        Coordinator(controller: self)
    }
    
    var numberOfPages: Int
    @Binding var currentPage: Int
    
    func makeUIView(context: Context) -> some UIPageControl {
        let controller = UIPageControl()
        controller.numberOfPages = numberOfPages
        controller.addTarget(context.coordinator, action: #selector(Coordinator.updateCurrentPage(sender:)), for: .valueChanged)
        return controller
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        uiView.currentPage = currentPage
    }
    
    
    class Coordinator: NSObject {
        var controller: PageControl
        init(controller: PageControl) {
            self.controller = controller
        }
        @objc
        func updateCurrentPage(sender: UIPageControl){
            controller.currentPage = sender.currentPage
        }
    }
}

