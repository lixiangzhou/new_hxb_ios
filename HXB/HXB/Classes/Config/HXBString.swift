//
//  HXBString.swift
//  HXB
//
//  Created by lxz on 2018/6/29.
//  Copyright © 2018年 lixiangzhou. All rights reserved.
//

import UIKit
import XZLib

extension hxb {
    struct string {
        /// 服务电话 【400-1552-888】
        static let servicePhone = "400-1552-888"
        
        /// 当从网络获取数据出错时提示 【网络出错，请检查网络】
        static let getdataErrorString = "网络出错，请检查网络"
        
        /// base url 存储路径
        static var urlStorePath: String = {
            var path = zz_filePath(fileName: "baseurlpath.data")
            path.append("/baseurlpath.data")
            return path
        }()
        
        static var storedBaseUrl: String? = {
            return try? String(contentsOfFile: urlStorePath, encoding: .utf8)
        }()
    }
}
