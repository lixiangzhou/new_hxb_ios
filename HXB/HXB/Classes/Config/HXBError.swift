//
//  HXBError.swift
//  HXB
//
//  Created by lxz on 2018/6/29.
//  Copyright © 2018年 lixiangzhou. All rights reserved.
//

import UIKit

enum HXBError: Error {
    case requestUrlNil
    case encodingFailed(error: Error)
}
