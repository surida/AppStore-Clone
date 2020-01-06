//
//  AppsHeaderCell.swift
//  AppStoreJSONApis
//
//  Created by 안관수 on 2020/01/06.
//  Copyright © 2020 Brian Voong. All rights reserved.
//

import RxSwift
import RxCocoa

class AppsHeaderCell: UICollectionViewCell {
    
    let companyLabel = UILabel(text: "Facebook", font: .systemFont(ofSize: 12))
    let titleLabel = UILabel(text: "Keeping up with friends is faster than ever", font: .systemFont(ofSize: 30))
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .red
        iv.layer.cornerRadius = 8
        iv.layer.masksToBounds = true
        return iv
    }()
    
    lazy var stackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [self.companyLabel, self.titleLabel, self.imageView])
        sv.axis = .vertical
        sv.spacing = 8
        return sv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
//        backgroundColor = .green
        
        addSubviews([stackView])
        layout()
    }
    
    func layout() {
        
        titleLabel.numberOfLines = 2
        companyLabel.textColor = .blue
        companyLabel.setContentHuggingPriority(.required, for: .vertical)
        titleLabel.setContentHuggingPriority(.defaultHigh, for: .vertical)
        imageView.setContentHuggingPriority(.defaultLow, for: .vertical)
        
        stackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
