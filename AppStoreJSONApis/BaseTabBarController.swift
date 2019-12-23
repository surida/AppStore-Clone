//
//  BaseTabBarController.swift
//  AppStoreJSONApis
//
//  Created by Brian Voong on 2/8/19.
//  Copyright © 2019 Brian Voong. All rights reserved.
//

import UIKit

class BaseTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let todayViewController = UIViewController()
        todayViewController.view.backgroundColor = .white
        todayViewController.navigationItem.title = "TODAY"
        
        let todayNavController = UINavigationController(rootViewController: todayViewController)
        todayNavController.tabBarItem.title = "Today"
        todayNavController.tabBarItem.image = #imageLiteral(resourceName: "today_icon")
        todayNavController.navigationBar.prefersLargeTitles = true
        
        let redViewController = UIViewController()
        redViewController.view.backgroundColor = .white
        redViewController.navigationItem.title = "APPS"
        
        let appsNavController = UINavigationController(rootViewController: redViewController)
        appsNavController.tabBarItem.title = "Apps"
        appsNavController.tabBarItem.image = #imageLiteral(resourceName: "apps")
        appsNavController.navigationBar.prefersLargeTitles = true
        
        let searchNavController = UINavigationController(rootViewController: AppsSearchController())
        searchNavController.tabBarItem.title = "Search"
        searchNavController.navigationBar.prefersLargeTitles = true
        searchNavController.tabBarItem.image = UIImage(named: "search")
        
        viewControllers = [
            searchNavController,
            todayNavController,
            appsNavController,
            
        ]
    }
    
}


import SwiftUI
@available(iOS 13.0, *)

struct BaseTabBarPreview: PreviewProvider {
    
    struct ContainerView: UIViewControllerRepresentable {
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<BaseTabBarPreview.ContainerView>) -> UIViewController {
            return BaseTabBarController()
        }
        
        func updateUIViewController(_ uiViewController: BaseTabBarPreview.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<BaseTabBarPreview.ContainerView>) {
        }
    }
    
    static var previews: some View {
//        Text("123")
        ContainerView()
    }
    
    
}
