//
//  HXBListPlanModel.swift
//  HXB
//
//  Created by lxz on 2018/7/6.
//Copyright © 2018年 lixiangzhou. All rights reserved.
//

import UIKit

class HXBListPlanModel: HXBModel {
    /// 锁定期限(月),计划期限（新手产品如果是月也用此字段，int类型）
    var lockPeriod: String = ""
    /// 运营文案
    var tag: String = ""
    /// 开始销售时间
    var beginSellingTime: String = ""
    /// hxb: 2.4版本推荐位按月付息；newbie: 2.5版本新手产品，包含推荐位按月付息
    var cashType: String = ""
    /// 计划状态
    var unifyStatus: String = ""
    /// 最小注册金额
    var minRegisterAmount: String = ""
    /// 基础利率
    var baseInterestRate: String = ""
    var id: String = ""
    /// 销售结束时间
    var endSellingTime: String = ""
    /// 本期加息利率
    var extraInterestRate: String = ""
    /// 年化利率
    var expectedRate: String = ""
    /// 计划名称
    var name: String = ""
    /// 计划倒计时
    var diffTime: Int = 0
    /// 还款方式
    var featuredSlogan: String = ""
    /// 是否打折
    var hasDiscountCoupon = false
    /// 是否满减
    var hasMoneyOffCoupon = false
    /// // 锁定期限(月)扩展
    var extendLockPeriod: String = ""
}
