//
//  HXBTransferListViewModel.swift
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

class HXBTransferListViewModel: HXBViewModel {
    var (reloadDataSignal, reloadDataObserver) = Signal<(), NoError>.pipe()
    
    var dataSource = [HXBListTransferModel]()
    
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
        
        HXBNetworkManager.request(url: hxb.api.transfer, params: ["page": page], method: .get) { requestApi in
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
                    
                    if let dataList = json["data"]["dataList"].arrayObject,
                        let modelList = [HXBListTransferModel].deserialize(from: dataList) as? [HXBListTransferModel] {
                        if isNew {
                            self.dataSource = modelList
                        } else {
                            self.dataSource.append(contentsOf: modelList)
                        }
                        self.reloadDataObserver.send(value: ())
                    }
                }
        }
    }
}
