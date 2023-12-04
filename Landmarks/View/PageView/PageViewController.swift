//
//  File.swift
//  Landmarks
//
//  Created by TE-Member on 04/12/2023.
//

import SwiftUI



struct PageViewController<Page: View>: UIViewControllerRepresentable {

    var pages: [Page]
    @Binding var currentPage: Int
    
    func makeUIViewController(context: Context) ->  UIPageViewController {
        let pageViewController = UIPageViewController(
            transitionStyle: .scroll, navigationOrientation: .horizontal
        )
        pageViewController.dataSource = context.coordinator
        pageViewController.delegate = context.coordinator
        return pageViewController
    }
    
    func updateUIViewController(_ pageViewController: UIPageViewController, context: Context) {
        pageViewController.setViewControllers(
            [context.coordinator.controllers[currentPage]],
            direction: .forward,
            animated: true)
    }
    
    func makeCoordinator() -> Coordinator {
            Coordinator(self)
    }
    
    class Coordinator: NSObject, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
            guard let index =  controllers.firstIndex(of: viewController) else {
                return nil
            }
            if index == 0 {
                return controllers.last
            }
            return controllers[index - 1]
        }
        
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
            guard let index =  controllers.firstIndex(of: viewController) else {
                return nil
            }
            if index + 1 == controllers.count {
                return controllers.first
            }
            return controllers[index + 1]
        }
        
        func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
                if completed,
                   let visibleViewController = pageViewController.viewControllers?.first,
                   let index = controllers.firstIndex(of: visibleViewController){
                    parrent.currentPage = index
                }
        }
        
        
        var parrent: PageViewController
        var controllers = [UIViewController]()
        init(_ pageViewController: PageViewController) {
            self.parrent = pageViewController
            controllers = parrent.pages.map{
                UIHostingController(rootView: $0)
            }
        }
    }
}
