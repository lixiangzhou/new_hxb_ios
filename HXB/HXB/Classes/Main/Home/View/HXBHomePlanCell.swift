//
//  HXBHomePlanCell.swift
//  HXB
//
//  Created by lxz on 2018/7/11.
//Copyright © 2018年 lixiangzhou. All rights reserved.
//

import UIKit

class HXBHomePlanCell: UITableViewCell {
    
    // MARK: - Life Cycle
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Property
    static let identifier = "HXBHomePlanCellIdentifier"
    static let cellHeight: CGFloat = 44
    
    var cellViewModel: HXBHomePlanCellViewModel! {
        didSet {
            nameLabel.text = cellViewModel.nameText
            statusLabel.text = cellViewModel.statusText
            statusLabel.textColor = cellViewModel.statusTextColor
            interestLabel.attributedText = cellViewModel.interestAttributeString
            dateLabel.text = cellViewModel.dateText
            minRegisterLabel.text = cellViewModel.minRegisterText
            
            tagLabel.attributedText = cellViewModel.tagAttributeString
            if cellViewModel.planModel.tag.count > 0 {
                tagLabel.snp.updateConstraints { maker in
                    maker.top.equalTo(interestDescLabel.snp.bottom).offset(13)
                    maker.height.equalTo(16)
                }
            } else {
                tagLabel.snp.updateConstraints { maker in
                    maker.top.equalTo(interestDescLabel.snp.bottom).offset(0)
                    maker.height.equalTo(0)
                }
            }
        }
    }
    
    // MARK: - Private Property
    fileprivate let nameLabel = UILabel(font: hxb.font.f14, textColor: hxb.color.important)
    fileprivate let statusLabel = UILabel(font: hxb.font.f13, textColor: hxb.color.theme)
    fileprivate let interestLabel = UILabel(font: hxb.font.f32, textColor: hxb.color.theme)
    fileprivate let dateLabel = UILabel(font: hxb.font.f13, textColor: hxb.color.important)
    fileprivate let interestDescLabel = UILabel(text: "平均历史年化收益", font: hxb.font.f13, textColor: hxb.color.light)
    fileprivate let minRegisterLabel = UILabel(font: hxb.font.f13, textColor: hxb.color.important)
    fileprivate let tagLabel = UILabel(font: hxb.font.f11, textColor: hxb.color.tagColor)
}

// MARK: - UI
extension HXBHomePlanCell {
    fileprivate func setUI() {
        let bottomLine = UIView()
        
        contentView.addSubview(nameLabel)
        contentView.addSubview(statusLabel)
        contentView.addSubview(interestLabel)
        contentView.addSubview(dateLabel)
        contentView.addSubview(minRegisterLabel)
        contentView.addSubview(interestDescLabel)
        contentView.addSubview(tagLabel)
        contentView.addSubview(bottomLine)
        
        bottomLine.backgroundColor = hxb.color.sepLine
        tagLabel.backgroundColor = hxb.color.tagBgColor
        
        nameLabel.snp.makeConstraints { maker in
            maker.top.equalTo(18)
            maker.left.equalTo(hxb.length.edgeScreen)
        }
        
        statusLabel.snp.makeConstraints { maker in
            maker.right.equalTo(-hxb.length.edgeScreen)
            maker.bottom.equalTo(nameLabel)
        }
        
        interestLabel.snp.makeConstraints { maker in
            maker.top.equalTo(nameLabel.snp.bottom).offset(10)
            maker.left.equalTo(nameLabel)
        }
        
        dateLabel.snp.makeConstraints { maker in
            maker.right.equalTo(statusLabel)
            maker.bottom.equalTo(interestLabel.snp.bottom).offset(-5)
        }
        
        minRegisterLabel.snp.makeConstraints { maker in
            maker.bottom.equalTo(interestDescLabel)
            maker.right.equalTo(statusLabel)
        }
        
        interestDescLabel.snp.makeConstraints { maker in
            maker.left.equalTo(nameLabel)
            maker.top.equalTo(interestLabel.snp.bottom).offset(5)
        }
        
        tagLabel.snp.makeConstraints { maker in
            maker.top.equalTo(interestDescLabel.snp.bottom).offset(13)
            maker.height.equalTo(16)
            maker.left.equalTo(nameLabel)
            maker.bottom.equalTo(-18)
        }
        
        bottomLine.snp.makeConstraints { maker in
            maker.bottom.equalToSuperview()
            maker.left.equalTo(hxb.length.edgeScreen)
            maker.right.equalTo(-hxb.length.edgeScreen)
            maker.height.equalTo(hxb.length.sepLine)
        }
    }
}

