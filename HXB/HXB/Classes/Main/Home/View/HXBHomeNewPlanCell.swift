//
//  HXBHomeNewPlanCell.swift
//  HXB
//
//  Created by lxz on 2018/7/11.
//Copyright © 2018年 lixiangzhou. All rights reserved.
//

import UIKit

class HXBHomeNewPlanCell: UITableViewCell {
    
    // MARK: - Life Cycle
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Property
    static let identifier = "HXBHomeNewPlanCellIdentifier"
    static let cellHeight: CGFloat = 125
    
    // MARK: - Private Property
    
}

// MARK: - UI
extension HXBHomeNewPlanCell {
    fileprivate func setUI() {
        
    }
}

// MARK: - Action
extension HXBHomeNewPlanCell {
    
}

// MARK: - Helper
extension HXBHomeNewPlanCell {
    
}

// MARK: - Other
extension HXBHomeNewPlanCell {
    
}

// MARK: - Public
extension HXBHomeNewPlanCell {
    
}
