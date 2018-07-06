//
//  HXBPlanListCell.swift
//  HXB
//
//  Created by lxz on 2018/7/6.
//Copyright © 2018年 lixiangzhou. All rights reserved.
//

import UIKit

class HXBPlanListCell: UITableViewCell {
    
    // MARK: - Life Cycle
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Property
    static let identifier = "HXBPlanListCellIdentifier"
    static let cellHeight: CGFloat = 44
    
    // MARK: - Private Property
    
}

// MARK: - UI
extension HXBPlanListCell {
    fileprivate func setUI() {
        
    }
}

// MARK: - Action
extension HXBPlanListCell {
    
}

// MARK: - Helper
extension HXBPlanListCell {
    
}

// MARK: - Other
extension HXBPlanListCell {
    
}

// MARK: - Public
extension HXBPlanListCell {
    
}
