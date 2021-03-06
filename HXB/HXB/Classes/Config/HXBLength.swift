//
//  HXBLength.swift
//  HXB
//
//  Created by lxz on 2018/6/29.
//  Copyright © 2018年 lixiangzhou. All rights reserved.
//

import UIKit

fileprivate let isIPhoneX = UIScreen.zz_height == 812 && UIScreen.zz_width == 375

extension hxb {
    struct length {
        /// 距离屏幕两边的间距 【15】
        static let edgeScreen: CGFloat = 15
        
        /// 两个区域之间的间距 【10】
        static let view2View: CGFloat = 10
        
        /// 一级页面距离底部的距离 【50】
        static let bottom: CGFloat = 50
        
        /// 宽按钮距离屏幕边界的距离 【20】
        static let wideButtonEdgeScreen: CGFloat = 20
        
        /// 宽按钮高度 【41】
        static let wideButtonHeight: CGFloat = 41
        
        /// 宽按钮圆角 【4】
        static let wideButtonCornerRadius: CGFloat = 4
        
        /// 一般按钮的宽 【85】
        static let normalButtonWidth: CGFloat = 85
        
        /// 一般按钮的高 【30】
        static let normalButtonHeight: CGFloat = 30
        
        /// 一般按钮的圆角 【2】
        static let normalButtonCornerRadius: CGFloat = 2
        
        /// 分割线线宽 【0.5】
        static let sepLine: CGFloat = 0.5
        
        /// HXBInputFieldView 常用高度
        static let fieldCommonHeight: CGFloat = 60
        
        /// 通用行高 【44】
        static let commonRowHeight: CGFloat = 44
        
        /// 导航栏高度 【iPhone X：88、其他：64】
        static let navigationHeight: CGFloat = isIPhoneX ? 88 : 64
        
        /// 状态栏高度 【iPhone X：44、其他：20】
        static let statusBarHeight: CGFloat = isIPhoneX ? 44 : 20
        
        /// 状态栏额外高度 【iPhone X：24，其他：0】
        static let topAddtionHeight: CGFloat = isIPhoneX ? 24 : 0
        
        /// 底部额外高度 【iPhone X：34，其他：0】
        static let bottomAddtionHeight: CGFloat = isIPhoneX ? 34 : 0
        
        /// tabbar 高度 【iPhone X: 83，其他：49】
        static let tabbarHeight: CGFloat = isIPhoneX ? 83 : 49
        
        /// 手机号长度 【11】
        static let mobileLength = 11
        
        /// 身份证号长度 【18】
        static let idcardLength = 18
        
        /// HUD 的 cornerRadius 【5】
        static let hudCornerRadius: CGFloat = 5
        
        /// 银行卡号最小长度 【12】
        static let bankNoMinCount = 12
        
        /// 银行卡号最长长度 【24】
        static let bankNoMaxCount = 24
        
        /// 短信码长度 【6】
        static let msgCodeLength = 6
        
        /// inputView 常用高度 【50】
        static let inputHeight = 50
    }
}
