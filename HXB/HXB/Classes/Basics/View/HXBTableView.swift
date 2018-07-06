//
//  HXBTableView.swift
//  HXB
//
//  Created by lxz on 2018/7/5.
//Copyright © 2018年 lixiangzhou. All rights reserved.
//

import UIKit

class HXBTableView: UITableView {
    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
        
        separatorStyle = .none
        if #available(iOS 11.0, *) {
//            self.contentInsetAdjustmentBehavior = .never
        } else {
            
        }
    }
    
    convenience init(frame: CGRect = .zero, style: UITableViewStyle = .grouped, dataSource: UITableViewDataSource?, delegate: UITableViewDelegate?) {
        self.init(frame: frame, style: style)
        self.dataSource = dataSource
        self.delegate = delegate
        separatorStyle = .none
        backgroundColor = hxb.color.background
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
