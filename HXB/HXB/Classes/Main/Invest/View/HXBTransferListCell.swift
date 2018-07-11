//
//  HXBTransferListCell.swift
//  HXB
//
//  Created by lxz on 2018/7/6.
//Copyright © 2018年 lixiangzhou. All rights reserved.
//

import UIKit

class HXBTransferListCell: UITableViewCell {
    
    // MARK: - Life Cycle
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Property
    static let identifier = "HXBTransferListCellIdentifier"
    static let cellHeight: CGFloat = 110
    
    var transferModel: HXBTransferModel! {
        didSet {
            nameLabel.text = transferModel.title
            
            leftMoneyLabel.text = "待转让金额：\(transferModel.leftTransAmount)元"
            
            // 年利率
            interestLabel.text = transferModel.interest + "%"
            
            // 剩余期限
            let leftMonths = NSMutableAttributedString(string: transferModel.leftMonths)
            leftMonths.append(NSAttributedString(string: "个月", attributes: [NSAttributedStringKey.font: hxb.font.f12]))
            leftMonthLabel.attributedText = leftMonths
            
            // 状态
            statusBtn.setTitle(transferModel.statusText, for: .normal)
            
            if transferModel.status == "TRANSFERING" {
                statusBtn.setTitleColor(.white, for: .normal)
                statusBtn.setBackgroundImage(UIImage("bt_bg_nor"), for: .normal)
            } else {
                statusBtn.setTitleColor(hxb.color.disableTextColor, for: .normal)
                statusBtn.setBackgroundImage(UIImage("bt_bg_dis_gray"), for: .normal)
            }
        }
    }
    
    // MARK: - Private Property
    fileprivate let nameLabel = UILabel(text: "", font: hxb.font.f14, textColor: hxb.color.important)
    fileprivate let leftMoneyLabel = UILabel(text: "", font: hxb.font.f12, textColor: UIColor(stringHexValue: "D4AD72")!)
    fileprivate let interestLabel = UILabel(text: "", font: hxb.font.f25, textColor: hxb.color.theme)
    fileprivate let interestDescLabel = UILabel(text: "年利率", font: hxb.font.f12, textColor: hxb.color.disableTextColor)
    fileprivate let leftMonthLabel = UILabel(text: "", font: hxb.font.f17, textColor: hxb.color.important)
    fileprivate let leftMonthDescLabel = UILabel(text: "剩余期限", font: hxb.font.f12, textColor: hxb.color.disableTextColor)
    fileprivate let statusBtn = UIButton(font: hxb.font.f14)
    fileprivate let bottomLine = UIView()
}

// MARK: - UI
extension HXBTransferListCell {
    fileprivate func setUI() {
        contentView.addSubview(nameLabel)
        contentView.addSubview(leftMoneyLabel)
        contentView.addSubview(interestLabel)
        contentView.addSubview(interestDescLabel)
        contentView.addSubview(leftMonthLabel)
        contentView.addSubview(leftMonthDescLabel)
        contentView.addSubview(statusBtn)
        contentView.addSubview(bottomLine)
        
        bottomLine.backgroundColor = hxb.color.sepLine
        statusBtn.isUserInteractionEnabled = false
        
        nameLabel.snp.makeConstraints { maker in
            maker.top.equalTo(17)
            maker.left.equalTo(hxb.length.edgeScreen)
        }
        
        leftMoneyLabel.snp.makeConstraints { maker in
            maker.right.equalTo(-hxb.length.edgeScreen)
            maker.bottom.equalTo(nameLabel)
        }
        
        interestLabel.snp.makeConstraints { maker in
            maker.left.equalTo(nameLabel)
            maker.top.equalTo(nameLabel.snp.bottom).offset(10)
        }
        
        interestDescLabel.snp.makeConstraints { maker in
            maker.left.equalTo(nameLabel)
            maker.bottom.equalTo(-17)
        }
        
        leftMonthLabel.snp.makeConstraints { maker in
            maker.bottom.equalTo(interestLabel)
            maker.left.equalTo(leftMonthDescLabel)
        }
        
        leftMonthDescLabel.snp.makeConstraints { maker in
            maker.right.equalTo(contentView.snp.centerX)
            maker.bottom.equalTo(interestDescLabel)
        }
        
        statusBtn.snp.makeConstraints { maker in
            maker.right.equalTo(-hxb.length.edgeScreen)
            maker.bottom.equalTo(-22.5)
            maker.width.equalTo(80)
            maker.height.equalTo(27)
        }
        
        bottomLine.snp.makeConstraints { maker in
            maker.bottom.equalToSuperview()
            maker.left.equalTo(hxb.length.edgeScreen)
            maker.right.equalTo(-hxb.length.edgeScreen)
            maker.height.equalTo(hxb.length.sepLine)
        }
    }
}

