//
//  HXBHomePlanCell.swift
//  HXB
//
//  Created by lxz on 2018/7/11.
//Copyright © 2018年 lixiangzhou. All rights reserved.
//

import UIKit

class HXBHomePlanCell: UITableViewCell {
    
    // MARK: - Life Cycle
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Property
    static let identifier = "HXBHomePlanCellIdentifier"
    static let cellHeight: CGFloat = 44
    
    // MARK: - Private Property
    
}

// MARK: - UI
extension HXBHomePlanCell {
    fileprivate func setUI() {
        
    }
}

// MARK: - Action
extension HXBHomePlanCell {
    
}

// MARK: - Helper
extension HXBHomePlanCell {
    
}

// MARK: - Other
extension HXBHomePlanCell {
    
}

// MARK: - Public
extension HXBHomePlanCell {
    
}
