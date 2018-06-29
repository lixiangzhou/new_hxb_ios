//
//  JSON+HXB.swift
//  HXB
//
//  Created by lxz on 2018/6/29.
//  Copyright © 2018年 lixiangzhou. All rights reserved.
//

import UIKit
import SwiftyJSON

extension JSON {
    var statusCode: Int {
        return self["status"].intValue
    }
    
    var message: String {
        return self["message"].stringValue
    }
    
    var isSuccess: Bool {
        return statusCode == hxb.code.success
    }
}
