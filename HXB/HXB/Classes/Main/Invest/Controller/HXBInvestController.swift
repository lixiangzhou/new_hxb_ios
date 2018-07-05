//
//  HXBInvestController.swift
//  HXB
//
//  Created by lxz on 2018/6/29.
//  Copyright © 2018年 lixiangzhou. All rights reserved.
//

import UIKit

class HXBInvestController: HXBViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
    }
    
}

// MARK: - UI
extension HXBInvestController {
    fileprivate func setUI() {
        backItemStyle = .none
        navigationBarBackgroundStyle = .clear
        
        setSegView()
    }
    
    private func setSegView() {
        let topView = UIView()
        topView.backgroundColor = .white
        view.addSubview(topView)
        
        let tempView = UIView()
        topView.addSubview(tempView)
        
        let segView = HXBSegView()
        segView.items = ["红利智投", "散标", "债权转让"]
        segView.itemSelectedColor = hxb.color.theme
        segView.itemNormalColor = hxb.color.important
        segView.itemHighlightColor = hxb.color.theme
        segView.itemFont = hxb.font.f15
        segView.sepLineColor = .clear
        segView.animateLineWidth = 28
        segView.animateLineHeight = 3
        segView.animateLineColor = hxb.color.theme
        
        topView.addSubview(segView)
        
        let bottomLine = UIView()
        bottomLine.backgroundColor = hxb.color.background
        segView.insertSubview(bottomLine, belowSubview: segView.animateLine)
        
        topView.snp.makeConstraints { maker in
            maker.top.left.right.equalToSuperview()
            maker.height.equalTo(hxb.length.navigationHeight)
        }
        
        tempView.snp.makeConstraints { maker in
            maker.top.left.right.equalToSuperview()
            maker.height.equalTo(hxb.length.statusBarHeight)
        }
        
        segView.snp.makeConstraints { maker in
            maker.bottom.left.right.equalToSuperview()
            maker.top.equalTo(tempView.snp.bottom)
        }
        
        bottomLine.snp.makeConstraints { maker in
            maker.bottom.left.right.equalToSuperview()
            maker.height.equalTo(2)
        }
    }
}
