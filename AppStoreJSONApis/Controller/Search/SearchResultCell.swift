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
import SDWebImage

class SearchResultCell: UICollectionViewCell {
    
    let appIconImageView: UIImageView = {
        let iv = UIImageView()
        iv.layer.cornerRadius = 12
        iv.layer.masksToBounds = true
        return iv
    }()
    
    // Stasrt Vertical Stack View
    let nameLabel: UILabel = {
        let lb = UILabel()
        lb.text = "App Name"
        return lb
    }()
    
    let categoryLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Photos & Video"
        return lb
    }()
    
    let ratingLabel: UILabel = {
        let lb = UILabel()
        lb.text = "9.26M"
        return lb
    }()
    
    lazy var lableVStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [
            self.nameLabel,
            self.categoryLabel,
            self.ratingLabel,
            UILabel(font: UIFont.systemFont(ofSize: 14), color: .white, text: " ")
        ])
        sv.axis = .vertical
        return sv
    }()
    // End Vertical Stack View
    
    let getBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("GET", for: .normal)
        btn.setTitleColor(.blue, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        btn.backgroundColor = UIColor(white: 0.95, alpha: 1)
        btn.layer.cornerRadius = 16
        btn.layer.masksToBounds = true
        return btn
    }()
    
    lazy var topHStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [self.appIconImageView, lableVStackView, self.getBtn])
        sv.axis = .horizontal
        sv.spacing = 12
        sv.alignment = .center
        return sv
    }()
    
    lazy var screenshot1ImageView = self.createScreenShotImageView()
    lazy var screenshot2ImageView = self.createScreenShotImageView()
    lazy var screenshot3ImageView = self.createScreenShotImageView()
    
    lazy var screenShotStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [
            self.screenshot1ImageView,
            self.screenshot2ImageView,
            self.screenshot3ImageView
        ])
        sv.axis = .horizontal
        sv.distribution = .fillEqually
        sv.spacing = 8
        return sv
    }()
    
    lazy var overallStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [
            self.topHStackView,
            self.screenShotStackView
        ])
        sv.axis = .vertical
        sv.spacing = 16
        return sv
    }()
    
    func createScreenShotImageView() -> UIImageView {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit // change something?
        iv.layer.cornerRadius = 8
        iv.layer.masksToBounds = true
        iv.layer.borderWidth = 0.5
        iv.layer.borderColor = UIColor.init(white: 0.5, alpha: 0.5).cgColor
        return iv
    }
    
    var resultItem: ITunesSearchResultItem! {
        didSet {
            nameLabel.text = resultItem.trackName
            categoryLabel.text = resultItem.primaryGenreName.rawValue
            ratingLabel.text = "\(resultItem.averageUserRating ?? 0.0)"
            appIconImageView.sd_setImage(with: URL(string: resultItem.artworkUrl100), completed: nil)
            
            if resultItem.screenshotUrls.count > 0 {
                screenshot1ImageView.sd_setImage(with: URL(string: resultItem.screenshotUrls[0]), completed: nil)
            }
            
            if resultItem.screenshotUrls.count > 1 {
                screenshot2ImageView.sd_setImage(with: URL(string: resultItem.screenshotUrls[1]), completed: nil)
            }
            
            if resultItem.screenshotUrls.count > 2 {
                screenshot3ImageView.sd_setImage(with: URL(string: resultItem.screenshotUrls[2]), completed: nil)
            }
            
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(overallStackView)
        layout()
    }
    
    func layout() {
        overallStackView.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(16)
//            $0.height.equalTo(150)
        }
        
        appIconImageView.snp.makeConstraints {
            $0.width.height.equalTo(80)
        }
        
        getBtn.snp.makeConstraints {
            $0.width.equalTo(85)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
