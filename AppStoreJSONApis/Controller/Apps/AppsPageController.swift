//
//  AppsController.swift
//  AppStoreJSONApis
//
//  Created by 안관수 on 2020/01/03.
//  Copyright © 2020 Brian Voong. All rights reserved.
//

import RxSwift
import RxCocoa
import RxDataSources

class AppsPageController: UIViewController {
    let bag = DisposeBag()
    private let cellId = "cellId"
    private let headerId = "headerId"

    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.register(AppsGroupCell.self, forCellWithReuseIdentifier: cellId)
        cv.register(AppsPageHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId)
        cv.backgroundColor = .white
        cv.contentInset = UIEdgeInsets(top: 16, left: 0, bottom: 16, right: 0)
        return cv
    }()
    
    let iTunesService: ITunesService = ITunesService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Apps"
        self.view.addSubviews([collectionView])
        layout()
        bind()
    }
    
    func bind() {
                    
        let items = Observable
            .zip(
                iTunesService.fetchGame().map { $0.feed }.asObservable(),
                iTunesService.fetchTopGrossing().map { $0.feed }.asObservable(),
                iTunesService.fetchTopFree().map { $0.feed }.asObservable()
            )
            .map {
                [SectionModel(model: "frist", items: [$0, $1, $2])]
            }
            .share()
        
        
        let dataSource = RxCollectionViewSectionedReloadDataSource<SectionModel<String, Feed>>(
            configureCell: { [unowned self] (ds, cv, indexPath, item) -> AppsGroupCell in
                let cell = cv.dequeueReusableCell(withReuseIdentifier: self.cellId, for: indexPath) as! AppsGroupCell
                cell.feed = item
                return cell
            },
            configureSupplementaryView: { [unowned self] (ds, cv, kind, indexPath) -> UICollectionReusableView in
                let sectionModel = ds.sectionModels[indexPath.section].model
                let headerView = cv.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: self.headerId, for: indexPath)
                return headerView
            }
        )
        
        items
            .bind(to: collectionView.rx.items(dataSource: dataSource))
            .disposed(by: bag)
        
        collectionView.rx.setDelegate(self).disposed(by: bag)
        
    }
    
    func layout() {
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

extension AppsPageController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: collectionView.frame.width, height: 300)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: collectionView.frame.width, height: 300)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
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
            let naviVC = UINavigationController(rootViewController: AppsPageController())
            naviVC.navigationBar.prefersLargeTitles = true
            return naviVC
        }
        
        func updateUIViewController(_ uiViewController: AppsControllerPreView.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<AppsControllerPreView.ContainerView>) {
            //...
        }
    }
    
}
