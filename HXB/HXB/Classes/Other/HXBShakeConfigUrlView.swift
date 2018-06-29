//
//  HXBShakeConfigUrlView.swift
//  HXB
//
//  Created by lxz on 2018/6/29.
//  Copyright © 2018年 lixiangzhou. All rights reserved.
//

import UIKit
import SnapKit

class HXBShakeConfigUrlView: UIView {
    
    static let animateDuration: TimeInterval = 0.5
    // MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Property
    
    // MARK: - Private Property
    fileprivate let fieldView = UITextField()
    fileprivate let button = UIButton(title: "确定", font: hxb.font.f16, titleColor: UIColor.white, backgroundColor: hxb.color.mostImport)
}

// MARK: - UI
extension HXBShakeConfigUrlView {
    fileprivate func setUI() {
        backgroundColor = UIColor.white
        fieldView.placeholder = "请输入url, 例如:\(hxb.net.baseUrl)"
        fieldView.font = hxb.font.f15
        fieldView.borderStyle = .roundedRect
        fieldView.text = hxb.net.baseUrl
        button.reactive.controlEvents(.touchUpInside).observeValues { [weak self, weak fieldView] _ in
            let url = fieldView?.text ?? ""
            self?.saveUrl(url: url)
            self?.alpha = 1
            UIView.animate(withDuration: HXBShakeConfigUrlView.animateDuration, animations: {
                self?.alpha = 0
            }, completion: { (_) in
                self?.removeFromSuperview()
            })
        }
        
        addSubview(fieldView)
        addSubview(button)
        
        fieldView.snp.makeConstraints { maker in
            maker.top.equalTo(150)
            maker.width.equalTo(250)
            maker.height.equalTo(30)
            maker.centerX.equalToSuperview()
        }
        
        button.snp.makeConstraints { maker in
            maker.top.equalTo(fieldView.snp.bottom).offset(20)
            maker.width.equalTo(120)
            maker.height.equalTo(35)
            maker.centerX.equalToSuperview()
        }
    }
}

// MARK: - Helper
extension HXBShakeConfigUrlView {
    @discardableResult
    fileprivate func saveUrl(url: String) -> Bool {
        do {
            try url.write(toFile: hxb.string.urlStorePath, atomically: true, encoding: .utf8)
            hxb.net.baseUrl = url
            HXBKeychain[hxb.keychain.url] = url
            return true
        } catch {
            return false
        }
    }
}

// MARK: - Public
extension HXBShakeConfigUrlView {
    static func show() {
        let shakeConfigUrlView = HXBShakeConfigUrlView()
        shakeConfigUrlView.frame = UIScreen.main.bounds
        shakeConfigUrlView.alpha = 0
        UIApplication.shared.keyWindow!.addSubview(shakeConfigUrlView)
        UIView.animate(withDuration: HXBShakeConfigUrlView.animateDuration, animations: {
            shakeConfigUrlView.alpha = 1
        })
    }
}
