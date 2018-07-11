//
//  HXBFont.swift
//  HXB
//
//  Created by lxz on 2018/6/29.
//  Copyright © 2018年 lixiangzhou. All rights reserved.
//

import UIKit

extension hxb {
    private static let fontName = "HelveticaNeue"
    struct font {
        /// 用于个人账户也最重要金额文字 【40】
        static let f40 = UIFont(name: fontName, size: 40)!
        
        static let f32 = UIFont(name: fontName, size: 32)!
        
        /// 用于强调性醒目文字 【25】
        static let f25 = UIFont(name: fontName, size: 25)!
        
        /// 用于页面主要标题内容 【19】
        static let f19 = UIFont(name: fontName, size: 19)!
        
        /// 用于导航栏标题 【18】
        static let f18 = UIFont(name: fontName, size: 18)!
        
        /// 用于导航栏标题(多个标题时) 【17】
        static let f17 = UIFont(name: fontName, size: 17)!
        
        /// 用于一级button文字 【16】
        static let f16 = UIFont(name: fontName, size: 16)!
        
        /// 用于大部分正文内容文字 【15】
        static let f15 = UIFont(name: fontName, size: 15)!
        
        /// 用于交易、体现记录中文字【14】
        static let f14 = UIFont(name: fontName, size: 14)!
        
        static let f13 = UIFont(name: fontName, size: 13)!
        /// 用于协调等辅助性文字 【12】
        static let f12 = UIFont(name: fontName, size: 12)!
        
        static let f11 = UIFont(name: fontName, size: 11)!
        
        /// 用于tabbar 【10】
        static let f10 = UIFont(name: fontName, size: 10)!
    }
}

