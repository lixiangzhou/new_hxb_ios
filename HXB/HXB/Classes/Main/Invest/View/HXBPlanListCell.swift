//
//  HXBPlanListCell.swift
//  HXB
//
//  Created by lxz on 2018/7/6.
//Copyright © 2018年 lixiangzhou. All rights reserved.
//

import UIKit

class HXBPlanListCell: UITableViewCell {
    
    // MARK: - Life Cycle
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Property
    static let identifier = "HXBPlanListCellIdentifier"
    static let cellHeight: CGFloat = 44
    
    var planListCellViewModel: HXBPlatListCellViewModel! {
        didSet {
            
            updateNameTagView()
            
            nameLabel.attributedText = planListCellViewModel.nameAttributeString
            tagLabel.attributedText = planListCellViewModel.tagAttributeString
            interestLabel.attributedText = planListCellViewModel.interestAttributeString
            dateLabel.attributedText = planListCellViewModel.dateAttributeString
            
            statusBtn.setTitle(planListCellViewModel.statusText, for: .normal)
            statusBtn.setTitleColor(planListCellViewModel.statusTextColor, for: .normal)
            statusBtn.setBackgroundImage(planListCellViewModel.statusBackgroundImage, for: .normal)
            
            updatePreferentialViews()
        }
    }
    
    // MARK: - Private Property
    fileprivate let nameLabel = UILabel(text: "", font: hxb.font.f14, textColor: hxb.color.important)
    fileprivate let tagLabel = UILabel(text: "", font: hxb.font.f11, textColor: UIColor(stringHexValue: "FD9718")!)
    fileprivate let interestLabel = UILabel(text: "", font: hxb.font.f25, textColor: hxb.color.theme)
    fileprivate let interestDescLabel = UILabel(text: "平均历史年化收益", font: hxb.font.f12, textColor: hxb.color.important)
    fileprivate let dateLabel = UILabel(text: "", font: hxb.font.f17, textColor: hxb.color.important)
    fileprivate let dateDescLabel = UILabel(text: "适应出借期限", font: hxb.font.f12, textColor: hxb.color.important)
    fileprivate let statusBtn = UIButton(font: hxb.font.f14)
    fileprivate let preferentialView = UIView()
    fileprivate let bottomLine = UIView()
}

// MARK: - UI
extension HXBPlanListCell {
    fileprivate func setUI() {
        contentView.addSubview(nameLabel)
        contentView.addSubview(tagLabel)
        contentView.addSubview(interestLabel)
        contentView.addSubview(interestDescLabel)
        contentView.addSubview(dateLabel)
        contentView.addSubview(dateDescLabel)
        contentView.addSubview(statusBtn)
        contentView.addSubview(preferentialView)
        contentView.addSubview(bottomLine)
        
        tagLabel.backgroundColor = UIColor(stringHexValue: "FD971814")
        tagLabel.layer.cornerRadius = 1
        tagLabel.layer.masksToBounds = true
        bottomLine.backgroundColor = hxb.color.sepLine
        statusBtn.isUserInteractionEnabled = false
        
        nameLabel.snp.makeConstraints { maker in
            maker.top.equalTo(25)
            maker.left.equalTo(hxb.length.edgeScreen)
            maker.height.equalTo(14)
        }
        
        tagLabel.snp.makeConstraints { maker in
            maker.bottom.equalTo(nameLabel)
            maker.right.equalTo(-hxb.length.edgeScreen)
            maker.height.equalTo(20)
        }
        
        interestLabel.snp.makeConstraints { maker in
            maker.left.equalTo(nameLabel)
            maker.top.equalTo(nameLabel.snp.bottom).offset(18)
        }
        
        dateLabel.snp.makeConstraints { maker in
            maker.centerX.equalToSuperview()
            maker.bottom.equalTo(interestLabel)
        }
        
        interestDescLabel.snp.makeConstraints { maker in
            maker.left.equalTo(nameLabel)
            maker.top.equalTo(interestLabel.snp.bottom).offset(13)
        }
        
        dateDescLabel.snp.makeConstraints { maker in
            maker.bottom.equalTo(interestDescLabel)
            maker.centerX.equalToSuperview()
        }
        
        statusBtn.snp.makeConstraints { maker in
            maker.right.equalTo(-hxb.length.edgeScreen)
            maker.centerY.equalTo(interestLabel.snp.bottom)
            maker.width.equalTo(80)
            maker.height.equalTo(27)
        }
        
        preferentialView.snp.makeConstraints { maker in
            maker.top.equalTo(interestDescLabel.snp.bottom)
            maker.left.equalTo(nameLabel)
            maker.height.equalTo(0)
            maker.width.equalTo(statusBtn)
        }
        
        bottomLine.snp.makeConstraints { maker in
            maker.bottom.equalToSuperview()
            maker.left.equalTo(hxb.length.edgeScreen)
            maker.right.equalTo(-hxb.length.edgeScreen)
            maker.height.equalTo(hxb.length.sepLine)
            maker.top.equalTo(preferentialView.snp.bottom).offset(25)
        }
    }
    
    
}

// MARK: - Helper
extension HXBPlanListCell {
    fileprivate func updatePreferentialViews() {
        for v in preferentialView.subviews {
            v.removeFromSuperview()
        }
        
        if planListCellViewModel.hasPreferential {
            preferentialView.snp.updateConstraints { maker in
                maker.height.equalTo(33)
            }
            preferentialView.isHidden = false
            
            //            if planListCellViewModel.listPlanModel {
            //                let jx = "\(planListCellViewModel.listPlanModel)%"
            //                let btn = addTagToPreferentialView(title: jx, titleColor: UIColor(stringHexValue: "F9817")!, imgName: "jx_background")
            //                btn.sizeToFit()
            //                btn.zz_size = CGSize(width: btn.zz_size.width + 4, height: 16)
            //            }
            if planListCellViewModel.listPlanModel.hasMoneyOffCoupon {
                let btn = addTagToPreferentialView(title: "满减", titleColor: UIColor(stringHexValue: "4C7BFE")!, imgName: "mj_background")
                btn.zz_size = CGSize(width: 32, height: 16)
            }
            
            if planListCellViewModel.listPlanModel.hasDiscountCoupon {
                let btn = addTagToPreferentialView(title: "折扣", titleColor: UIColor(stringHexValue: "FF3B2D")!, imgName: "zk_background")
                btn.zz_size = CGSize(width: 32, height: 16)
            }
            
            var x: CGFloat = 0
            for btn in preferentialView.subviews {
                btn.zz_x = x
                btn.zz_y = 17
                x = x + btn.zz_width + 4
            }
        } else {
            preferentialView.snp.updateConstraints { maker in
                maker.height.equalTo(0)
            }
            preferentialView.isHidden = true
        }
        
        
    }
    
    private func addTagToPreferentialView(title: String, titleColor: UIColor, imgName: String) -> UIButton {
        let btn = UIButton()
        btn.isUserInteractionEnabled = false
        btn.setBackgroundImage(UIImage(imgName), for: .normal)
        btn.setTitle(title, for: .normal)
        btn.setTitleColor(titleColor, for: .normal)
        btn.titleLabel?.font = hxb.font.f11
        btn.titleEdgeInsets = UIEdgeInsets(top: -2, left: 0, bottom: 0, right: 0)
        preferentialView.addSubview(btn)
        return btn
    }
    
    fileprivate func updateNameTagView() {
        if planListCellViewModel.listPlanModel.novice == 1 {
            nameLabel.snp.updateConstraints { maker in
                maker.height.equalTo(0)
            }
            
            tagLabel.snp.updateConstraints { maker in
                maker.height.equalTo(0)
            }
            
            interestLabel.snp.makeConstraints { maker in
                maker.top.equalTo(nameLabel.snp.bottom).offset(0)
            }
            
            nameLabel.isHidden = true
            tagLabel.isHidden = true
        } else {
            nameLabel.snp.updateConstraints { maker in
                maker.height.equalTo(14)
            }
            
            tagLabel.snp.updateConstraints { maker in
                maker.height.equalTo(20)
            }
            
            interestLabel.snp.makeConstraints { maker in
                maker.top.equalTo(nameLabel.snp.bottom).offset(18)
            }
            
            nameLabel.isHidden = false
            tagLabel.isHidden = false
        }
        
    }
}
