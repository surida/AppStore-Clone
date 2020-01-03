//
//  AppsGroupCell.swift
//  AppStoreJSONApis
//
//  Created by 안관수 on 2020/01/03.
//  Copyright © 2020 Brian Voong. All rights reserved.
//

import RxSwift
import RxCocoa

class AppsGroupCell: UICollectionViewCell {
    let bag = DisposeBag()
    private let cellId = "cellId"

    
    let titleLabel = UILabel(text: "App Section", font: .boldSystemFont(ofSize: 30))
    let horizontalController = AppsHorizontalController()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.backgroundColor = .purple
        contentView.addSubviews([
            titleLabel,
            horizontalController.view
        ])
        layout()        
    }
    
    func layout() {
        titleLabel.snp.makeConstraints {
            $0.leading.top.right.equalToSuperview()
        }
        
        horizontalController.view.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom)
            $0.left.right.bottom.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
