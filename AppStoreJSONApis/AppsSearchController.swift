//
//  AppsSearchController.swift
//  AppStoreJSONApis
//
//  Created by 안관수 on 2019/12/23.
//  Copyright © 2019 Brian Voong. All rights reserved.
//

import UIKit

class AppsSearchController: UIViewController {
    
    private let cellId = "cellId"
    
    lazy var collectionView: UICollectionView = {
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .vertical
            
            let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
            cv.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellId)
            return cv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .green
    }
    
}

import SwiftUI
@available(iOS 13.0, *)

struct AppesSearchPreView: PreviewProvider {

    static var previews: some View {
//        Text("123")
        ContainerView()
    }

    
    struct ContainerView: UIViewControllerRepresentable {
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<AppesSearchPreView.ContainerView>) -> UIViewController {
            return AppsSearchController()
        }
        
        func updateUIViewController(_ uiViewController: AppesSearchPreView.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<AppesSearchPreView.ContainerView>) {
        }
    }
    
}



