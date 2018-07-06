//
//  HXBRefreshFooter.swift
//  HXB
//
//  Created by lxz on 2018/7/6.
//Copyright © 2018年 lixiangzhou. All rights reserved.
//

import UIKit
import XZLib

class HXBRefreshFooter: ZZRefreshFooter {
    override var state: ZZRefreshState {
        didSet {
            switch self.state {
            case .normal, .willRefreshing:
                UIView.animate(withDuration: 0.25) {
                    self.titleLabel.text = "上拉获取数据..."
                    self.indicatorView.isHidden = true
                    self.iconView.isHidden = false
                    self.iconView.transform = CGAffineTransform.init(rotationAngle: CGFloat(Double.pi) - 0.0001)
                }
            case .releaseRefreshing:
                UIView.animate(withDuration: 0.25) {
                    self.titleLabel.text = "松开刷新数据..."
                    self.indicatorView.isHidden = true
                    self.iconView.isHidden = false
                    self.iconView.transform = CGAffineTransform.init(rotationAngle: 0)
                }
            case .refreshing:
                UIView.animate(withDuration: 0.25) {
                    self.titleLabel.text = "正在刷新......"
                    self.indicatorView.isHidden = false
                    self.iconView.isHidden = true
                    self.iconView.transform = CGAffineTransform.init(rotationAngle: 0)
                }
            }
        }
    }
    
    override func setupUI() {
        let contentView = UIView()
        addSubview(contentView)
        
        contentView.addSubview(iconView)
        contentView.addSubview(indicatorView)
        contentView.addSubview(titleLabel)
        
        iconView.transform = CGAffineTransform.init(rotationAngle: CGFloat(Double.pi) - 0.0001)
        indicatorView.hidesWhenStopped = false
        indicatorView.startAnimating()
        indicatorView.stopAnimating()
        
        iconView.snp.makeConstraints { maker in
            maker.left.centerY.equalToSuperview()
            maker.height.width.equalTo(25)
        }
        
        indicatorView.snp.makeConstraints { maker in
            maker.center.equalTo(iconView)
        }
        
        titleLabel.snp.makeConstraints { maker in
            maker.right.centerY.equalToSuperview()
            maker.left.equalTo(iconView.snp.right).offset(5)
        }
        
        contentView.snp.makeConstraints { maker in
            maker.center.equalToSuperview()
        }
    }
    
    private let titleLabel = UILabel(text: "", font: hxb.font.f12, textColor: hxb.color.light)
    private let iconView = UIImageView(named: "refresh_icon")
    private let indicatorView = UIActivityIndicatorView(activityIndicatorStyle: .gray)
}
