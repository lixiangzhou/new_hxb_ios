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
        
        let iv = UIImageView(frame: CGRect(x: 20, y: 90, width: 100, height: 100))
        
        view.addSubview(iv)
    }
}
