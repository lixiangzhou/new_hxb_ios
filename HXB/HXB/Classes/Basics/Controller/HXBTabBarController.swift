//
//  HXBTabBarController.swift
//  HXB
//
//  Created by lxz on 2018/6/29.
//  Copyright © 2018年 lixiangzhou. All rights reserved.
//

import UIKit

class HXBTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        addChildControllers()
        setUI()
    }
}

// MARK: - UI
extension HXBTabBarController {
    fileprivate func addChildControllers() {
        add(childController: HXBHomeController(), title: "首页", imageName: "tabbar_home")
        add(childController: HXBInvestController(), title: "投资", imageName: "tabbar_investment")
        add(childController: HXBMineController(), title: "我的", imageName: "tabbar_me")
    }
    
    fileprivate func setUI() {
        view.backgroundColor = UIColor.white
    }
    
    private func add(childController: HXBViewController, title: String, imageName: String) {
        childController.title = title
        
        childController.tabBarItem.setTitleTextAttributes([NSAttributedStringKey.foregroundColor: hxb.color.theme], for: .selected)
        childController.tabBarItem.setTitleTextAttributes([NSAttributedStringKey.foregroundColor: hxb.color.normal], for: .normal)
        
        childController.tabBarItem.image = UIImage(imageName)?.withRenderingMode(.alwaysOriginal)
        childController.tabBarItem.selectedImage = UIImage(imageName + "_selected")?.withRenderingMode(.alwaysOriginal)
        
        let navVC = HXBNavigationController(rootViewController: childController)
        addChildViewController(navVC)
    }
}

// MARK: - Other
extension HXBTabBarController {
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        HXBShakeConfigUrlView.show()
    }
}
