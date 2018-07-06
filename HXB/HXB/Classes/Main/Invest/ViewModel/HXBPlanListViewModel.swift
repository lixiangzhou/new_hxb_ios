//
//  HXBPlanListViewModel.swift
//  HXB
//
//  Created by lxz on 2018/7/6.
//Copyright © 2018年 lixiangzhou. All rights reserved.
//

import UIKit
import ReactiveSwift
import Result

class HXBPlanListViewModel: HXBViewModel {
    
    var planListProducer: SignalProducer<[HXBListPlanModel], NoError>!
    
    override init() {
        super.init()
        
    }
}
