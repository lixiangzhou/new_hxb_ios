//
//  HXBRequestApi.swift
//  HXB
//
//  Created by lxz on 2018/6/29.
//  Copyright © 2018年 lixiangzhou. All rights reserved.
//

import UIKit

class HXBRequestApi {
    init() { }
    
    // MARK: - Request
    
    /// 原始请求
    var request: URLRequest?
    /// 请求方法
    var requestMethod: HXBHttpMethod = .get
    /// 请求url
    var requestUrl: String?
    /// 请求baseUrl
    var baseUrl: String?
    /// 请求参数
    var params: HXBRequestParam?
    /// 请求超时
    var timeout: TimeInterval = 30
    /// 请求头
    var requestHeaderFields: HXBRequestHeader?
    
    // MARK: - Response
    
    /// 原始响应
    var httpResponse: HTTPURLResponse?
    /// 响应状态码
    var statusCode: Int? {
        return httpResponse?.statusCode
    }
    /// 响应头
    var responseHeaderFields: [String : Any]? {
        return httpResponse?.allHeaderFields as? [String : Any]
    }
    /// 响应错误
    var error: Error?
    /// 响应结果 responseSerializeType 是 .json时有效
    var responseObject: HXBResponseObject?
    /// 响应结果 responseSerializeType 是 .data时有效
    var responseData: Data?
    
    // MARK: -
    /// 请求任务
    var dataTask: URLSessionDataTask?
    
    /// 响应结果的序列号方式
    var responseSerializeType = HXBResponseSerializeType.json
    
    // MARK: - HUD
    weak var hudDelegate: HXBHUDShowDelegate?
    /// Progress 显示容器类型
    var hudProgressType: HXBHudContainerType = .view
    /// Toast 显示容器类型
    var hudToastType: HXBHudContainerType = .view
}

extension HXBRequestApi {
    enum HXBResponseSerializeType {
        case json, data
    }
}

// MARK: - HUD Method
extension HXBRequestApi {
    
    /// 显示 Progress
    func showProgress() {
        hudDelegate?.showProgress(type: hudProgressType)
    }
    
    /// 隐藏 Progress
    func hideProgress() {
        hudDelegate?.hideProgress(type: hudProgressType)
    }
    
    /// 显示 Toast
    ///
    /// - Parameter toast: toast
    func show(toast: String) {
        hudDelegate?.show(toast: toast, type: hudToastType)
    }
}


