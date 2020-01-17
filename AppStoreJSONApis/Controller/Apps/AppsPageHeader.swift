//
//  AppsPageHeader.swift
//  AppStoreJSONApis
//
//  Created by 안관수 on 2020/01/06.
//  Copyright © 2020 Brian Voong. All rights reserved.
//

import RxSwift
import RxCocoa

class AppsPageHeader: UICollectionReusableView {
    
    let pageController = AppsHeaderHorizontalController()
    
    var socialAppList: ITunesSocialAppList? {
        didSet {
            pageController.socialAppList = socialAppList
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .blue
        
        addSubviews([pageController.view])
        layout()
    }
    
    func layout() {
        pageController.view.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
