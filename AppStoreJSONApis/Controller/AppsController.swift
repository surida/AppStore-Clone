//
//  AppsController.swift
//  AppStoreJSONApis
//
//  Created by 안관수 on 2020/01/03.
//  Copyright © 2020 Brian Voong. All rights reserved.
//

import RxSwift
import RxCocoa

class AppsController: UIViewController {
    let bag = DisposeBag()
    private let cellId = "cellId"

    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.register(AppsGroupCell.self, forCellWithReuseIdentifier: cellId)
        cv.backgroundColor = .yellow
        return cv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Apps"
        self.view.addSubviews([collectionView])
        layout()
        bind()
    }
    
    func bind() {
        
        Observable.from([1, 2, 3, 4, 5, 6, 7])
            .bind(to: collectionView.rx.items(cellIdentifier: cellId, cellType: AppsGroupCell.self)) { (row, element, cell) in
                // code here
            }
            .disposed(by: bag)
        
        collectionView.rx.setDelegate(self).disposed(by: bag)
        
    }
    
    func layout() {
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

extension AppsController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: collectionView.frame.width, height: 180)
    }
    
}

import SwiftUI
@available(iOS 13.0, *)

struct AppsControllerPreView: PreviewProvider {
    
    static var previews: some View {
        ContainerView()
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<AppsControllerPreView.ContainerView>) -> UIViewController {
            let naviVC = UINavigationController(rootViewController: AppsController())
            naviVC.navigationBar.prefersLargeTitles = true
            return naviVC
        }
        
        func updateUIViewController(_ uiViewController: AppsControllerPreView.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<AppsControllerPreView.ContainerView>) {
            //...
        }
    }
    
}
