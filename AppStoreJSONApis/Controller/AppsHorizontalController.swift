//
//  AppsHorizontalController.swift
//  AppStoreJSONApis
//
//  Created by 안관수 on 2020/01/03.
//  Copyright © 2020 Brian Voong. All rights reserved.
//

import RxSwift
import RxCocoa

class AppsHorizontalController: UIViewController {
    let bag = DisposeBag()
    private let cellId = "cellId"

    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        cv.backgroundColor = .purple
        return cv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .brown
        self.view.addSubviews([collectionView])
        layout()
        bind()
    }
    
    func bind() {
        Observable.from([1, 2, 3, 4, 5, 6, 7])
            .bind(to: collectionView.rx.items(cellIdentifier: cellId, cellType: UICollectionViewCell.self)) { (row, element, cell) in
                cell.contentView.backgroundColor = .red
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

extension AppsHorizontalController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: collectionView.frame.width - 18 - 16*2, height: (collectionView.frame.height - 8*2 - 12*2) / 3) //- 8*2 - 12*2
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 12, left: 16, bottom: 12, right: 16) //.init(top: 12, left: 16, bottom: 12, right: 16)
    }
}

import SwiftUI
@available(iOS 13.0, *)

struct AppsHorizontalControllerPreview: PreviewProvider {
    
    static var previews: some View {
//        Text("123")
        ContainerView()
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<AppsHorizontalControllerPreview.ContainerView>) -> UIViewController {
            return AppsHorizontalController()
        }
        
        func updateUIViewController(_ uiViewController: AppsHorizontalControllerPreview.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<AppsHorizontalControllerPreview.ContainerView>) {
            // ...
        }
    }
}
