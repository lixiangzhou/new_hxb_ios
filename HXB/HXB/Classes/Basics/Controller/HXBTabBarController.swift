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

extension HXBTabBarController {
    fileprivate func addChildControllers() {
        add(childController: HXBHomeController(), title: "首页", imageName: "tabbar_home")
        add(childController: HXBInvestController(), title: "投资", imageName: "tabbar_investment")
        add(childController: HXBMineController(), title: "我的", imageName: "tabbar_mine")
    }
    
    fileprivate func setUI() {
        view.backgroundColor = UIColor.white
    }
    
    private func add(childController: HXBViewController, title: String, imageName: String) {
        childController.title = title
        
        childController.tabBarItem.setTitleTextAttributes([NSAttributedStringKey.foregroundColor: UIColor.black], for: .selected)
        childController.tabBarItem.setTitleTextAttributes([NSAttributedStringKey.foregroundColor: UIColor.white], for: .normal)
        
        let navVC = HXBNavigationController(rootViewController: childController)
        addChildViewController(navVC)
    }
}
