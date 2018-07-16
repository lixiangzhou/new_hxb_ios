//
//  HXBHomeHeaderCell.swift
//  HXB
//
//  Created by lxz on 2018/7/12.
//Copyright © 2018年 lixiangzhou. All rights reserved.
//

import UIKit
import Kingfisher

class HXBHomeHeaderCell: UICollectionViewCell {
    
    // MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var banner: HXBHomeBannerModel! {
        didSet {
            imageView.kf.setImage(with: URL(string: banner.image), placeholder: UIImage("home_banner_placeholder"), options: nil, progressBlock: nil, completionHandler: nil)
        }
    }
    
    // MARK: - Public Property
    static let identifier = "HXBHomeHeaderCellIdentifier"
    
    // MARK: - Private Property
    fileprivate let imageView = UIImageView(image: UIImage("home_banner_placeholder"))
}

// MARK: - UI
extension HXBHomeHeaderCell {
    fileprivate func setUI() {
        imageView.layer.cornerRadius = 3
        imageView.layer.masksToBounds = true
        contentView.addSubview(imageView)
        imageView.snp.makeConstraints { maker in
            maker.edges.equalToSuperview()
        }
    }
}
