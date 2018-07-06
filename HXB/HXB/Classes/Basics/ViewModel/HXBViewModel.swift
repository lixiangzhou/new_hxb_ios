//
//  HXBViewModel.swift
//  HXB
//
//  Created by lxz on 2018/6/29.
//  Copyright © 2018年 lixiangzhou. All rights reserved.
//

import UIKit
import SwiftyJSON

class HXBViewModel: NSObject {
    weak var hudView: UIView?
    
    convenience init(_ hudView: UIView? = nil) {
        self.init()
        
        self.hudView = hudView
    }
}

extension HXBViewModel {
    func requestResult(_ isSuccess: Bool, _ requestApi: HXBRequestApi, errorToast: String? = hxb.string.getdataErrorString, showToast: Bool = true) -> Bool {
        if isSuccess {
            let json = JSON(requestApi.responseObject!)
            if json.isSuccess {
                return true
            } else {
                show(toast: json.message, canShow: showToast, requestApi: requestApi)
                return false
            }
        } else {
            show(toast: errorToast, canShow: showToast, requestApi: requestApi)
            return false
        }
    }
    
    private func show(toast: String?, canShow: Bool, requestApi: HXBRequestApi) {
        if canShow && toast != nil {
            requestApi.show(toast: toast!)
        }
    }
}

extension HXBViewModel: HXBHUDShowDelegate {
    func showProgress(type: HXBHudContainerType) {
        hudProgress(type: type) { toView in
            HXBHUD.showLoding(toView: toView)
        }
    }
    
    func hideProgress(type: HXBHudContainerType) {
        hudProgress(type: type) { toView in
            HXBHUD.hideLoding(forView: toView)
        }
    }
    
    func show(toast: String, type: HXBHudContainerType) {
        if let toView = hudToastView(type: type) {
            HXBHUD.show(toast: toast, in: toView)
        }
    }
}

extension HXBViewModel {
    fileprivate func hudToastView(type: HXBHudContainerType) -> UIView? {
        var toView: UIView?
        switch type {
        case .window:
            toView = UIApplication.shared.keyWindow
        case .view:
            toView = hudView
        case .none:
            toView = nil
        }
        return toView
    }
    
    fileprivate func hudProgress(type: HXBHudContainerType, process: (UIView) -> ()) {
        var toView: UIView?
        switch type {
        case .window:
            toView = UIApplication.shared.keyWindow
        case .view:
            toView = hudView
        case .none:
            toView = nil
        }
        if let toView = toView {
            process(toView)
        }
    }
}
