//
//  HXBColor.swift
//  HXB
//
//  Created by lxz on 2018/6/29.
//  Copyright © 2018年 lixiangzhou. All rights reserved.
//

import UIKit

extension hxb {
    struct color {
        
        /// 用于特别需要强调和突出的文字、按钮和icon 【f55151】
        static let mostImport = UIColor(stringHexValue: "f55151")!
        static let theme = UIColor(stringHexValue: "ff3b2d")!
        
        /// 用于重要的文字信息、内容标题 【333333】
        static let important = UIColor(stringHexValue: "333333")!
        
        /// 小面积使用，用于重要链接文字、活动入口 【73adff】
        static let linkActivity = UIColor(stringHexValue: "73adff")!
        
        /// 用于普通级段落信息 【666666】
        static let normal = UIColor(stringHexValue: "666666")!
        
        /// 用于辅助、次要的文字等 【999999】
        static let light = UIColor(stringHexValue: "999999")!
        
        /// 用于色块之间的间隔底色填充 【f5f5f9】
        static let view2ViewFill = UIColor(stringHexValue: "f5f5f9")!
        
        /// 用于分割线 【dddddd】
        static let sepLine = UIColor(stringHexValue: "dddddd")!
        
        /// 背景色 【f5f5f9】
        static let background = UIColor(stringHexValue: "f5f5f9")!
        
        /// HUD 背景色 【UIColor(white: 0.2, alpha: 0.8)】
        static let hudBackground = UIColor(white: 0.2, alpha: 0.8)
        
        /// 弹框按钮取消背景色
        static let alertCancelBtn = UIColor(stringHexValue: "e5e6eb")!
        
        /// 半透明背景 UIColor.init(white: 0.5, alpha: 0.8)
        static let alphaBackgroundColor = UIColor.init(white: 0.5, alpha: 0.8)
        
        /// 用于特别需要强调和突出的颜色填充，颜色值范围：【fe654d ~ ff3d4f】
        ///
        /// - Parameter hex: 16进制颜色值
        /// - Returns: UIColor
        static func importantFill(hex: String) -> UIColor {
            return UIColor(stringHexValue: hex)!
        }
    }
}
