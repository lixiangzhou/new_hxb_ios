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
    fileprivate var tableView = HXBTableView(style: .plain, dataSource: nil, delegate: nil)
    fileprivate var viewModel: HXBHomeViewModel!
}

// MARK: - UI
extension HXBHomeController {
    fileprivate func setUI() {
        backItemStyle = .none
        navigationBarBackgroundStyle = .white
        
        setNavigationViews()
        
        tableView.register(HXBPlanListCell.self, forCellReuseIdentifier: HXBPlanListCell.identifier)
        tableView.estimatedRowHeight = 130
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { maker in
            maker.top.equalToSuperview().offset(view.safeAreaInsets.top)
            maker.left.right.equalToSuperview()
            maker.bottom.equalToSuperview().offset(view.safeAreaInsets.bottom)
        }
        
//        tableView.header = HXBRefreshHeader(target: self, action: #selector(getData))
    }
    
    private func setNavigationViews() {
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
