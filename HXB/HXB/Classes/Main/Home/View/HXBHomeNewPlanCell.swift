//
//  HXBHomeNewPlanCell.swift
//  HXB
//
//  Created by lxz on 2018/7/11.
//Copyright © 2018年 lixiangzhou. All rights reserved.
//

import UIKit

class HXBHomeNewPlanCell: UITableViewCell {
    
    // MARK: - Life Cycle
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Property
    static let identifier = "HXBHomeNewPlanCellIdentifier"
    
    var cellViewModel: HXBHomePlanCellViewModel! {
        didSet {
            interestLabel.attributedText = cellViewModel.interestAttributeString
            dateAndMinRegisterLabel.text = cellViewModel.dateAndMinRegisterText
            
            statusBtn.setTitle(cellViewModel.statusText, for: .normal)
            statusBtn.setBackgroundImage(cellViewModel.statusBackgroundImage, for: .normal)
            statusBtn.setTitleColor(cellViewModel.statusTextColor, for: .normal)
        }
    }
    
    // MARK: - Private Property
    fileprivate let interestLabel = UILabel()
    fileprivate let interestDescLabel = UILabel(text: "平均历史年化收益", font: hxb.font.f13, textColor: hxb.color.normal)
    fileprivate let dateAndMinRegisterLabel = UILabel(font: hxb.font.f13, textColor: hxb.color.moneyDescColor)
    fileprivate let statusBtn = UIButton(font: hxb.font.f15)
}

// MARK: - UI
extension HXBHomeNewPlanCell {
    fileprivate func setUI() {
        let lineColor = UIColor(stringHexValue: "4C65F8")!
        let leftLine = UIView()
        leftLine.backgroundColor = lineColor
        statusBtn.isUserInteractionEnabled = false
        
        contentView.addSubview(leftLine)
        contentView.addSubview(interestLabel)
        contentView.addSubview(interestDescLabel)
        contentView.addSubview(dateAndMinRegisterLabel)
        contentView.addSubview(statusBtn)
        
        leftLine.snp.makeConstraints { maker in
            maker.top.equalTo(10)
            maker.left.equalTo(hxb.length.edgeScreen)
            maker.height.equalTo(109)
            maker.width.equalTo(3)
            maker.bottom.equalTo(-7)
        }
        
        interestLabel.snp.makeConstraints { maker in
            maker.top.equalTo(leftLine).offset(12.5)
            maker.left.equalTo(leftLine.snp.right).offset(15)
        }
        
        interestDescLabel.snp.makeConstraints { maker in
            maker.top.equalTo(interestLabel.snp.bottom).offset(6.5)
            maker.left.equalTo(interestLabel)
        }
        
        dateAndMinRegisterLabel.snp.makeConstraints { maker in
            maker.bottom.equalTo(leftLine).offset(-14.5)
            maker.left.equalTo(interestLabel)
        }
        
        statusBtn.snp.makeConstraints { maker in
            maker.centerY.equalTo(leftLine)
            maker.right.equalTo(-hxb.length.edgeScreen)
            maker.width.equalTo(110)
            maker.height.equalTo(32)
        }
    }
}

// MARK: - Action
extension HXBHomeNewPlanCell {
    
}

// MARK: - Helper
extension HXBHomeNewPlanCell {
    
}

// MARK: - Other
extension HXBHomeNewPlanCell {
    
}

// MARK: - Public
extension HXBHomeNewPlanCell {
    
}
