//
//  AppRowCell.swift
//  AppStoreJSONApis
//
//  Created by 안관수 on 2020/01/06.
//  Copyright © 2020 Brian Voong. All rights reserved.
//

import RxSwift
import RxCocoa

class AppRowCell: UICollectionViewCell {
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .purple
        iv.layer.cornerRadius = 16
        iv.layer.masksToBounds = true
        iv.snp.makeConstraints {
            $0.width.height.equalTo(64)
        }
        return iv
    }()
    
    let nameLabel = UILabel(text: "App Name", font: .systemFont(ofSize: 20))
    let companyLabel = UILabel(text: "Company Name", font: .systemFont(ofSize: 13))
    
    lazy var labelsVStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [self.nameLabel, self.companyLabel])
        sv.axis = .vertical
        return sv
    }()
    
    let getBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("GET", for: .normal)
        btn.setTitleColor(.blue, for: .normal)
        btn.titleLabel?.font = .boldSystemFont(ofSize: 16)
        btn.backgroundColor = .init(white: 0.95, alpha: 1)
        btn.snp.makeConstraints {
            $0.width.equalTo(80)
            $0.height.equalTo(32)
        }
        btn.layer.cornerRadius = 32 / 2
        return btn
    }()
    
    lazy var overAllHStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [self.imageView, self.labelsVStackView, self.getBtn])
        sv.axis = .horizontal
        sv.alignment = .center
        sv.setCustomSpacing(8, after: self.imageView)
        return sv
    }()
    
    var feedResult: FeedResult? {
        didSet {
            nameLabel.text = feedResult?.name
            companyLabel.text = feedResult?.artistName
            if let urlStr = feedResult?.artworkUrl100 {
                imageView.sd_setImage(with: URL(string: urlStr), completed: nil)
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
//        self.backgroundColor = .orange
        addSubviews([overAllHStackView])
        layout()
    }
    
    func layout() {
        overAllHStackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
