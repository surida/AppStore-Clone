//
//  AppsSearchController.swift
//  AppStoreJSONApis
//
//  Created by 안관수 on 2019/12/23.
//  Copyright © 2019 Brian Voong. All rights reserved.
//

import RxSwift
import RxCocoa
import SnapKit
import RxDataSources


class AppsSearchController: UIViewController {
    let bag = DisposeBag()
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
        self.navigationItem.title = "SEARCH"
        self.view.backgroundColor = .green
        
        self.view.addSubview(collectionView)
        layout()
        bind()
    }
    
    func bind() {
        
        Observable.from([1, 2, 3])
            .bind(to: collectionView.rx.items(cellIdentifier: cellId, cellType: UICollectionViewCell.self)) { (item, element, cell) in
                cell.backgroundColor = .red
            }
            .disposed(by: bag)
        
        
    }
    
    func layout() {
        collectionView.snp.makeConstraints {
            if #available(iOS 11.0, *) {
                $0.top.equalTo(self.view.safeAreaLayoutGuide.snp.topMargin).offset(0)
            } else {
                $0.top.equalTo(topLayoutGuide.snp.bottom).offset(0)
            }
            $0.left.right.bottom.equalToSuperview().inset(0)
        }
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
            let naviVC = UINavigationController(rootViewController: AppsSearchController())
            naviVC.navigationBar.prefersLargeTitles = true
            return naviVC
        }
        
        func updateUIViewController(_ uiViewController: AppesSearchPreView.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<AppesSearchPreView.ContainerView>) {
        }
    }
    
}



