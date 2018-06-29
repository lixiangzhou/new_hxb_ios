//
//  HXBHUD.swift
//  HXB
//
//  Created by lxz on 2018/6/29.
//  Copyright © 2018年 lixiangzhou. All rights reserved.
//

import XZLib

struct HXBHUD {
    static func show(toast: String, in view: UIView = UIApplication.shared.keyWindow!) {
        ZZHud.show(message: toast,
                   font: hxb.font.f12,
                   color: UIColor.white,
                   backgroundColor: hxb.color.hudBackground,
                   cornerRadius: hxb.length.hudCornerRadius,
                   showDuration: 1,
                   toView: view)
    }
    
    static func showLoding(toView: UIView) {
        let loadingBgView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        let activityView = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
        activityView.startAnimating()
        
        loadingBgView.addSubview(activityView)
        activityView.center = loadingBgView.center
        
        ZZHud.show(loading: loadingBgView,
                   loadingId: NSNotFound,
                   toView: toView,
                   hudCornerRadius: hxb.length.hudCornerRadius,
                   hudBackgroundColor: hxb.color.hudBackground,
                   hudAlpha: 1,
                   contentInset: UIEdgeInsetsMake(0, 0, 0, 0),
                   position: .center,
                   offsetY: 0,
                   animation: nil)
    }
    
    static func hideLoding(forView: UIView) {
        ZZHud.hideLoading(for: forView)
    }
}
