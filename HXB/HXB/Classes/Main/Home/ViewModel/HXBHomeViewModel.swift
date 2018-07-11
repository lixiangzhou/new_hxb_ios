//
//  HXBHomeViewModel.swift
//  HXB
//
//  Created by lxz on 2018/7/11.
//Copyright © 2018年 lixiangzhou. All rights reserved.
//

import UIKit
import ReactiveSwift
import Result
import SwiftyJSON
import HandyJSON

class HXBHomeViewModel: HXBViewModel {
    var (reloadDataSignal, reloadDataObserver) = Signal<(), NoError>.pipe()
    
    var dataSource = [HXBHomePlanCellViewModel]()
    
    override init() {
        super.init()
    }
    
    @objc func getData() {
        HXBNetworkManager.request(url: hxb.api.home, params: ["cashType": "newbie"], method: .get) { requestApi in
            requestApi.hudDelegate = self
            }.startWithValues { isSuccess, requestApi in
                if self.requestResult(isSuccess, requestApi) {
                    let json = JSON(requestApi.responseObject!)
                    
                    if let dataList = json["data"]["homePlanRecommend"].arrayObject,
                        let modelList = [HXBPlanModel].deserialize(from: dataList) as? [HXBPlanModel] {
                        
                        var vmList = [HXBHomePlanCellViewModel]()
                        for model in modelList {
                            let vm = HXBHomePlanCellViewModel()
                            vm.planModel = model
                            vmList.append(vm)
                        }
                        self.dataSource = vmList
                        self.reloadDataObserver.send(value: ())
                    }
                }
        }
    }
}
