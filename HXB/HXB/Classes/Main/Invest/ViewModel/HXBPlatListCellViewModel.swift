//
//  HXBPlatListCellViewModel.swift
//  HXB
//
//  Created by lxz on 2018/7/10.
//Copyright © 2018年 lixiangzhou. All rights reserved.
//

import UIKit

class HXBPlatListCellViewModel: HXBViewModel {
    
    var nameAttributeString: NSAttributedString?
    
    var tagAttributeString: NSAttributedString?
    
    var interestAttributeString: NSAttributedString?
    
    var dateAttributeString: NSAttributedString?
    
    var hasPreferential = false
    
    var statusBackgroundImage: UIImage?
    
    var statusTextColor: UIColor?
    
    var statusText: String?
    
    var planModel: HXBPlanModel! {
        didSet {
            nameAttributeString = calNameAttributeString()
            tagAttributeString = calTagAttributeString()
            interestAttributeString = calInterestAttributeString()
            dateAttributeString = calDateAttributeString()
            
            calStatusValues()
            
            // TODO: 缺加息的判断
            hasPreferential = planModel.hasDiscountCoupon || planModel.hasMoneyOffCoupon
        }
    }
    
    private func calNameAttributeString() -> NSAttributedString {
        var period = ""
        let lockPeriod = Int(planModel.lockPeriod) ?? 0
        switch lockPeriod {
        case ...3:
            period = "短期"
        case 4...6:
            period = "中期"
        case 7...12:
            period = "中长期"
        case 12...:
            period = "长期"
        default:
            period = ""
        }
        let nameAttributeString = NSMutableAttributedString(string: "\(period) - \(lockPeriod)个月")
        nameAttributeString.append(NSAttributedString(string: " | ", attributes: [NSAttributedStringKey.foregroundColor: UIColor(stringHexValue: "D8D8D8")!]))
        nameAttributeString.append(NSAttributedString(string: "\(planModel.minRegisterAmount)元起投", attributes: [NSAttributedStringKey.font: hxb.font.f12]))
        return nameAttributeString
    }
    
    private func calTagAttributeString() -> NSAttributedString? {
        if planModel.tag.count > 0 {
            let tagAttributeString = NSMutableAttributedString()
            
            let attachment = NSTextAttachment()
            attachment.image = UIImage("tag_present")
            attachment.bounds = CGRect(x: 0, y: -2, width: attachment.image!.size.width, height: attachment.image!.size.height)
            
            tagAttributeString.append(NSAttributedString(attachment: attachment))
            tagAttributeString.append(NSAttributedString(string: " "))
            tagAttributeString.append(NSAttributedString(string: planModel.tag))
            tagAttributeString.append(NSAttributedString(string: " "))
            
            return tagAttributeString
        }
        return nil
    }
    
    private func calInterestAttributeString() -> NSAttributedString {
        if planModel.novice == 1 && planModel.expectedRate.count > 0 {
            let interestAttributeString = NSMutableAttributedString(string: String(format: "%.1f", Double(planModel.expectedRate)!))
            if planModel.subsidyInterestRate.count > 0 {
                interestAttributeString.append(NSAttributedString(string: String(format: "%%+%.1f%%", Double(planModel.subsidyInterestRate)!), attributes: [NSAttributedStringKey.font: hxb.font.f14]))
            } else {
                interestAttributeString.append(NSAttributedString(string: "%"))
            }
            return interestAttributeString
        } else {
            let interestAttributeString = NSMutableAttributedString(string: String(format: "%.1f", Double(planModel.baseInterestRate)!))
            if planModel.extraInterestRate.count > 0 {
                interestAttributeString.append(NSAttributedString(string: String(format: "%%+%.1f%%", Double(planModel.extraInterestRate)!), attributes: [NSAttributedStringKey.font: hxb.font.f14]))
            } else {
                interestAttributeString.append(NSAttributedString(string: "%"))
            }
            return interestAttributeString
        }
    }
    
    private func calDateAttributeString() -> NSAttributedString {
        if planModel.lockPeriod.count > 0 {
            var lock = ""
            if planModel.novice == 1 {
                lock = planModel.lockPeriod
            } else {
                lock = planModel.extendLockPeriod
            }
            let dateAttributeString = NSMutableAttributedString(string: lock)
            dateAttributeString.append(NSAttributedString(string: "个月", attributes: [NSAttributedStringKey.font: hxb.font.f12]))
            return dateAttributeString
        } else if planModel.lockDays > 0 {
            let dateAttributeString = NSMutableAttributedString(string: "\(planModel.lockDays)")
            dateAttributeString.append(NSAttributedString(string: "天", attributes: [NSAttributedStringKey.font: hxb.font.f12]))
            return dateAttributeString
        } else {
            return NSAttributedString(string: "--")
        }
    }
    
    private func calStatusValues() {
        statusTextColor = hxb.color.disableTextColor
        statusBackgroundImage = UIImage("bt_bg_dis_gray")
        switch planModel.unifyStatus {
        case 0, 1, 2, 3, 4, 5:
            statusText = "等待加入"
        case 6:
            statusText = "立即加入"
            statusTextColor = UIColor.white
            statusBackgroundImage = UIImage("bt_bg_nor")
        case 7:
            statusText = "销售结束"
        case 8:
            statusText = "收益中"
        case 9:
            statusText = "开放期"
        case 10:
            statusText = "已退出"
        case 11:
            statusText = "退出中"
        default:
            statusText = ""
        }
    }
}
