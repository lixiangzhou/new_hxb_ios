//
//  HXBHomePlanCellViewModel.swift
//  HXB
//
//  Created by lxz on 2018/7/11.
//Copyright © 2018年 lixiangzhou. All rights reserved.
//

import UIKit

class HXBHomePlanCellViewModel: HXBViewModel {
    var nameText: String?
    
    var statusText: String?
    var statusTextColor: UIColor?
    var statusBackgroundImage: UIImage?
    
    var interestAttributeString: NSAttributedString?
    
    var dateText: String?
    
    var minRegisterText: String?
    
    var dateAndMinRegisterText: String?
    
    var tagAttributeString: NSAttributedString?
    
    private var isNew = false
    
    var planModel: HXBPlanModel! {
        didSet {
            isNew = planModel.novice == 1
            
            nameText = "红利智投 | " + planModel.featuredSlogan
            calStatusValues()
            interestAttributeString = calInterestAttributeString()
            dateText = "适应出借" + calDateText()
            minRegisterText = planModel.minRegisterAmount + "元起投"
            dateAndMinRegisterText = calDateText() + " | " + minRegisterText!
            tagAttributeString = calTagAttributeString()
        }
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
    
    private func calDateText() -> String {
        
        if planModel.lockPeriod.count > 0 {
            return "\(planModel.extendLockPeriod)个月"
        } else if planModel.lockDays > 0 {
            return "\(planModel.lockDays)天"
        } else {
            return "--"
        }
    }
    
    private func calInterestAttributeString() -> NSAttributedString {
        if isNew {
            let interestAttributeString = NSMutableAttributedString(string: String(format: "%.1f", Double(planModel.expectedRate)!), attributes: [NSAttributedStringKey.font: hxb.font.f32, NSAttributedStringKey.foregroundColor: hxb.color.important])
            interestAttributeString.append(NSAttributedString(string: "%+", attributes: [NSAttributedStringKey.font: hxb.font.f13, NSAttributedStringKey.foregroundColor: hxb.color.important]))
            if planModel.subsidyInterestRate.count > 0 {
                interestAttributeString.append(NSAttributedString(string: String(format: "%.1f", Double(planModel.subsidyInterestRate)!), attributes: [NSAttributedStringKey.font: hxb.font.f32, NSAttributedStringKey.foregroundColor: hxb.color.theme]))
                interestAttributeString.append(NSAttributedString(string: "%", attributes: [NSAttributedStringKey.font: hxb.font.f13, NSAttributedStringKey.foregroundColor: hxb.color.theme]))
            }
            return interestAttributeString
        } else {        
            let interestAttributeString = NSMutableAttributedString(string: String(format: "%.1f", Double(planModel.baseInterestRate)!))
            if planModel.extraInterestRate.count > 0 {
                interestAttributeString.append(NSAttributedString(string: String(format: "%%+%.1f%%", Double(planModel.extraInterestRate)!), attributes: [NSAttributedStringKey.font: hxb.font.f15]))
            } else {
                interestAttributeString.append(NSAttributedString(string: "%", attributes: [NSAttributedStringKey.font: hxb.font.f15]))
            }
            return interestAttributeString
        }
        
    }
    
    private func calStatusValues() {
        statusTextColor = UIColor(stringHexValue: "BCBCBC")
        if isNew {
            statusTextColor = hxb.color.disableTextColor
            statusBackgroundImage = UIImage("bt_bg_dis_gray")
        }
        switch planModel.unifyStatus {
        case 0, 1, 2, 3, 4, 5:
            statusText = "等待加入"
        case 6:
            statusText = "立即加入"
            statusTextColor = hxb.color.theme
            if isNew {
                statusTextColor = UIColor.white
                statusBackgroundImage = UIImage("bt_bg_nor")
            }
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
