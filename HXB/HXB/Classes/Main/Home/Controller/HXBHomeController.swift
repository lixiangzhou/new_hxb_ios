//
//  HXBHomeController.swift
//  HXB
//
//  Created by lxz on 2018/6/29.
//  Copyright © 2018年 lixiangzhou. All rights reserved.
//

import UIKit

class HXBHomeController: HXBViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setUI()
    }

}

// MARK: - UI
extension HXBHomeController {
    fileprivate func setUI() {
        backItemStyle = .none
        navigationBarBackgroundStyle = .white
        
        let titleLabel = UILabel(text: "红小宝", font: hxb.font.f19, textColor: hxb.color.important)
        let titleItem = UIBarButtonItem(customView: titleLabel)
        navigationItem.leftBarButtonItem = titleItem
        
        
        
    }
}
