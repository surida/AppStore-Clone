//
//  AppsHeaderHorizontalController.swift
//  AppStoreJSONApis
//
//  Created by 안관수 on 2020/01/06.
//  Copyright © 2020 Brian Voong. All rights reserved.
//

import RxSwift
import RxCocoa

class AppsHeaderHorizontalController: UIViewController {
    let bag = DisposeBag()
    private let cellId = "cellId"

    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.register(AppsHeaderCell.self, forCellWithReuseIdentifier: cellId)
        cv.backgroundColor = .white
        return cv
    }()

    var socialAppList: ITunesSocialAppList? {
        didSet {
            socialAppListSubject.accept(socialAppList!)
        }
    }
    
    var socialAppListSubject = BehaviorRelay<[ITunesSocialApp]>(value: [])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .purple
        self.view.addSubviews([collectionView])
        layout()
        bind()
    }
    
    func bind() {
//        Observable.from([1, 2, 3])
        socialAppListSubject
            .bind(to: collectionView.rx.items(cellIdentifier: cellId, cellType: AppsHeaderCell.self)) { (row, element, cell) in
//                cell.contentView.backgroundColor = row % 2 == 0 ? UIColor.yellow : UIColor.blue
                cell.appInfo = element
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

extension AppsHeaderHorizontalController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: collectionView.frame.width - 48, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
    }
    
}
