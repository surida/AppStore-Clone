//
//  SearchResultCell.swift
//  AppStoreJSONApis
//
//  Created by 안관수 on 2019/12/23.
//  Copyright © 2019 Brian Voong. All rights reserved.
//

import RxSwift
import RxCocoa
import SnapKit

class SearchResultCell: UICollectionViewCell {
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .red
        return iv
    }()
    
    let nameLabel: UILabel = {
        let lb = UILabel()
        lb.text = "App Name"
        lb.backgroundColor = .yellow
        return lb
    }()
    
    let getBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("GET", for: .normal)
        btn.setTitleColor(.blue, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        btn.backgroundColor = UIColor(white: 0.95, alpha: 1)
        return btn
    }()
    
    lazy var topHStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [self.imageView, self.nameLabel, self.getBtn])
        sv.axis = .horizontal
        sv.backgroundColor = .gray
        return sv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
//        self.backgroundColor = .yellow
        self.addSubview(topHStackView)
        layout()
    }
    
    func layout() {
        topHStackView.snp.makeConstraints {
            $0.top.left.right.equalToSuperview()
            $0.height.equalTo(100)
        }
        
        imageView.snp.makeConstraints {
            $0.width.height.equalTo(55)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
