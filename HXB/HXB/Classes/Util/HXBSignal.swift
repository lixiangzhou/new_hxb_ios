//
//  HXBSignal.swift
//  HXB
//
//  Created by lxz on 2018/6/29.
//  Copyright © 2018年 lixiangzhou. All rights reserved.
//

import UIKit
import ReactiveSwift
import Result

let (loginSignal, loginObserver) = Signal<[String: AnyObject]?, NoError>.pipe()
