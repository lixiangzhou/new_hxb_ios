//
//  HXBListTransferModel.swift
//  HXB
//
//  Created by lxz on 2018/7/6.
//Copyright © 2018年 lixiangzhou. All rights reserved.
//

import UIKit

class HXBListTransferModel: HXBModel {
    /// 借款标题
    var title = ""
    /// 转让id
    var transferId = ""
    /// 借款期数
    var loanMonths = ""
    /**
     状态
     TRANSFERING：正在转让，
     TRANSFERED：转让完毕，
     CANCLE：已取消，
     CLOSED_CANCLE：结标取消，
     OVERDUE_CANCLE：逾期取消，
     PRESALE：转让预售
     */
    var status = ""
    /// 利率
    var interest = ""
    /// 剩余期数
    var leftMonths = ""
    /// 剩余金额
    var leftTransAmount = ""
    /// 初始转让金额
    var initTransAmount = ""
    
    var statusText = ""
}
