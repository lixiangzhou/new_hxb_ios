//
//  HXBNet.swift
//  HXB
//
//  Created by lxz on 2018/6/29.
//  Copyright © 2018年 lixiangzhou. All rights reserved.
//

import UIKit
import AdSupport

extension hxb {
    struct net {
        static var baseUrl: String {
            return hxb.string.storedBaseUrl ?? "http://192.168.1.36:3100"
        }
        
        static let tokenKey = "X-Hxb-Auth-Token"
        static let userAgent = "X-Hxb-User-Agent"
        
        static let baseHeaderFields = ["X-Request-Id": UIDevice.current.identifierForVendor?.uuidString ?? "",
                                       "X-Hxb-Auth-Timestamp": Double(Date().timeIntervalSince1970 * 1000).description,
                                       "IDFA": ASIdentifierManager.shared().advertisingIdentifier.uuidString,
                                       "X-Hxb-User-Agent": "\(UIDevice.current.zz_version)/IOS \(UIDevice.current.systemVersion)/v\(Bundle.main.infoDictionary?["CFBundleShortVersionString"] ?? "") iphone"]
    }
}
