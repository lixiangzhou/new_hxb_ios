//
//  HXBViewController.swift
//  HXB
//
//  Created by lxz on 2018/6/29.
//  Copyright © 2018年 lixiangzhou. All rights reserved.
//

import UIKit

class HXBViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(hideNavigationBar, animated: animated)
        
    }
    
    /// 单独的隐藏导航栏
    var hideNavigationBar = false
    
    /// 返回按钮的样式
    var backItemStyle: HXBNavBackItemImageStyle = .gray {
        didSet {
            let img: UIImage!
            switch backItemStyle {
            case .gray:
                img = UIImage("nav_back_gray")
            case .white:
                img = UIImage("nav_back_white")
            case .none:
                img = nil
            }
            
            if let img = img {
                let backItem = UIBarButtonItem(image: img.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(back))
                navigationItem.leftBarButtonItem = backItem
            } else {
                navigationItem.leftBarButtonItem = nil
            }
        }
    }
    
    /// 导航栏的背景样式
    var navigationBarBackgroundStyle: HXBNavigationBarBackgroundStyle = .white {
        didSet {
            switch navigationBarBackgroundStyle {
            case .white:
                navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
                navigationController?.navigationBar.shadowImage = UIImage()
            case .clear:
                hideNavigationBar = true
                navigationController?.setNavigationBarHidden(hideNavigationBar, animated: true)
            case .gradientRed:
                
                navigationController?.navigationBar.shadowImage = UIImage()
            }
            
        }
    }
}

// MARK: - UI
extension HXBViewController {
    fileprivate func setUI() {
        backItemStyle = .gray
        navigationBarBackgroundStyle = .white
    }
}

// MARK: - Action
extension HXBViewController {
    @objc fileprivate func back() {
        navigationController?.popViewController(animated: true)
    }
}

extension HXBViewController {
    enum HXBNavBackItemImageStyle {
        case white
        case gray
        case none
    }
    
    enum HXBNavigationBarBackgroundStyle {
        case white
        case gradientRed
        case clear
    }
}
