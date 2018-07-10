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

    // MARK: - Private Property
    fileprivate let msgDot = UIView()
}

// MARK: - UI
extension HXBHomeController {
    fileprivate func setUI() {
        backItemStyle = .none
        navigationBarBackgroundStyle = .white
        
        let titleLabel = UILabel(text: "红小宝", font: hxb.font.f19, textColor: hxb.color.important)
        let titleItem = UIBarButtonItem(customView: titleLabel)
        navigationItem.leftBarButtonItem = titleItem
        
        let msgBtn = UIButton(imageName: "home_message", target: nil, action: nil)
        msgBtn.imageView?.contentMode = .scaleAspectFill
        msgDot.backgroundColor = UIColor(stringHexValue: "FF48AF")
        msgDot.layer.cornerRadius = 2.5
        msgDot.layer.masksToBounds = true
        msgBtn.addSubview(msgDot)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: msgBtn)
        
        msgDot.snp.makeConstraints { maker in
            maker.top.equalToSuperview()
            maker.right.equalToSuperview().offset(3)
            maker.width.height.equalTo(5)
        }
        
    }
}
