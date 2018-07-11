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
import SwiftyJSON
import HandyJSON

class HXBPlanListViewModel: HXBViewModel {
    
    var (reloadDataSignal, reloadDataObserver) = Signal<(), NoError>.pipe()
    
    var dataSource = [HXBPlatListCellViewModel]()
    
    var footerType: HXBFooterRefreshType = .moreData
    
    private var pageNumber = 1
    private var pageSize = 20
    private var totalCount = 0
    
    override init() {
        super.init()
        
    }
    
    func getData(isNew: Bool) {
        var page = 1
        if isNew == false {
            page = pageNumber + 1
        }
        
        HXBNetworkManager.request(url: hxb.api.plan, params: ["page": page], method: .get) { requestApi in
            requestApi.hudDelegate = self
            }.startWithValues { isSuccess, requestApi in
                if self.requestResult(isSuccess, requestApi) {
                    let json = JSON(requestApi.responseObject!)
                    
                    self.totalCount = json["data"]["totalCount"].intValue
                    self.pageSize = json["data"]["pageSize"].intValue
                    self.pageNumber = json["data"]["pageNumber"].intValue
                    
                    if self.pageSize > self.totalCount {
                        self.footerType = .none
                    } else if self.pageSize * self.pageNumber > self.totalCount {
                        self.footerType = .nomoreData
                    } else {
                        self.footerType = .moreData
                    }
                    
                    let dataList = [HXBPlanModel].deserialize(from: json["data"]["dataList"].arrayObject) as? [HXBPlanModel]
                    let recommendList = [HXBPlanModel].deserialize(from: json["data"]["recommendList"].arrayObject) as? [HXBPlanModel]
                    let newbieProductList = [HXBPlanModel].deserialize(from: json["data"]["newbieProductList"].arrayObject) as? [HXBPlanModel]
                    
                    var list = [HXBPlanModel]()
                    if newbieProductList != nil && newbieProductList!.count > 0 {
                        list.append(contentsOf: newbieProductList!)
                    }
                    
                    if recommendList != nil && recommendList!.count > 0 {
                        list.append(contentsOf: recommendList!)
                    }
                    
                    if dataList != nil && dataList!.count > 0 {
                        list.append(contentsOf: dataList!)
                    }

                    if list.count > 0 {
                        var vmList = [HXBPlatListCellViewModel]()
                        for model in list {
                            let vm = HXBPlatListCellViewModel()
                            vm.planModel = model
                            vmList.append(vm)
                        }
                        if isNew {
                            self.dataSource = vmList
                        } else {
                            self.dataSource.append(contentsOf: vmList)
                        }
                        self.reloadDataObserver.send(value: ())
                    }
                    
                }
        }
    }
}
