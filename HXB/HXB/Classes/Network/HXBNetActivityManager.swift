//
//  HXBNetActivityManager.swift
//  HXB
//
//  Created by lxz on 2018/6/29.
//  Copyright © 2018年 lixiangzhou. All rights reserved.
//

import UIKit
import ReactiveSwift
import ReactiveCocoa

class HXBNetActivityManager {
    static let shared = HXBNetActivityManager()
    
    private let requestCount = MutableProperty(0)
    private var lock = NSLock()
    
    private init() {
        UIApplication.shared.reactive.makeBindingTarget { $0.isNetworkActivityIndicatorVisible = $1 } <~ requestCount.signal.map { $0 > 0 }
    }
    
    func sendRequest() {
        safeCount {
            requestCount.value += 1
        }
    }
    
    func finishRequest() {
        safeCount {
            requestCount.value -= 1
        }
    }
    
    private func safeCount(_ count: () -> Void) {
        lock.lock()
        count()
        lock.unlock()
    }
    
    static func sendRequest() {
        HXBNetActivityManager.shared.sendRequest()
    }
    
    static func finishRequest() {
        HXBNetActivityManager.shared.finishRequest()
    }
    
}
