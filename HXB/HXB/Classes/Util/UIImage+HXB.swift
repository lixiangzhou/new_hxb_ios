//
//  UIImage+HXB.swift
//  HXB
//
//  Created by lxz on 2018/6/29.
//  Copyright © 2018年 lixiangzhou. All rights reserved.
//

import UIKit

extension UIImage {
    convenience init?(_ imgName: String) {
        self.init(named: imgName)
    }
}
