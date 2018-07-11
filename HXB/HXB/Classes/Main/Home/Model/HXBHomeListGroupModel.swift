//
//  HXBHomeListGroupModel.swift
//  HXB
//
//  Created by lxz on 2018/7/11.
//Copyright © 2018年 lixiangzhou. All rights reserved.
//

import UIKit

enum HXBHomeListGroupModelType: String {
    case new = "新手专享"
    case recomend = "优选产品"
}

class HXBHomeListGroupModel {
    var type: HXBHomeListGroupModelType
    var dataList: [HXBHomePlanCellViewModel]
    
    init(type: HXBHomeListGroupModelType, dataList: [HXBHomePlanCellViewModel]) {
        self.type = type
        self.dataList = dataList
    }
}
