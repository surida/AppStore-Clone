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
        cv.register(SearchResultCell.self, forCellWithReuseIdentifier: cellId)
        cv.backgroundColor = .white
        return cv
    }()
    
    let iTunesService: ITunesService = ITunesService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "SEARCH"
        self.view.backgroundColor = .white
        
        self.view.addSubview(collectionView)
        layout()
        bind()
    }
    
    func bind() {
        
        //https://itunes.apple.com/search?term=instagram&entity=software
        iTunesService.search(term: "instagram", entity: "software")
            .map { $0.results }
            .asObservable()
            .bind(to: collectionView.rx.items(cellIdentifier: cellId, cellType: SearchResultCell.self)) { (item, element, cell) in
                print("\(element)")
                cell.resultItem = element
            }
            .disposed(by: bag)
        
        collectionView.rx.setDelegate(self).disposed(by: bag)
        
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

extension AppsSearchController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: collectionView.frame.width, height: 320)
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
