//
//  HXBInvestController.swift
//  HXB
//
//  Created by lxz on 2018/6/29.
//  Copyright © 2018年 lixiangzhou. All rights reserved.
//

import UIKit

class HXBInvestController: HXBViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
    }
    
    
    // MARK: - Private Property
    fileprivate let planListController = HXBPlanListController()
    fileprivate let loanListController = HXBLoanListController()
    fileprivate let transferListController = HXBTransferListController()
    
    fileprivate let segView = HXBSegView()
    fileprivate var scrollView: UIScrollView!
}

// MARK: - UI
extension HXBInvestController {
    fileprivate func setUI() {
        navigationItem.title = nil
        backItemStyle = .none
        navigationBarBackgroundStyle = .white
        
        setSegView()
        
        scrollView = UIScrollView(frame: view.frame)
//        scrollView.contentInset.top = -hxb.length.navigationHeight
        scrollView.isPagingEnabled = true
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.layer.masksToBounds = false
        scrollView.delegate = self
        
        scrollView.contentSize = CGSize(width: view.zz_width * 3, height: 0)
        
        view.addSubview(scrollView)
        
        scrollView.snp.makeConstraints { maker in
            maker.edges.equalToSuperview()
        }
        
        
        planListController.isInnerVC = true
        loanListController.isInnerVC = true
        transferListController.isInnerVC = true
        addChildViewController(planListController)
        addChildViewController(loanListController)
        addChildViewController(transferListController)
        
        planListController.view.frame = CGRect(x: 0, y: 0, width: scrollView.zz_width, height: scrollView.zz_height)
        scrollView.addSubview(planListController.view)
        
        loanListController.view.frame = CGRect(x: scrollView.zz_width, y: 0, width: scrollView.zz_width, height: scrollView.zz_height)
        scrollView.addSubview(loanListController.view)
        
        transferListController.view.frame = CGRect(x: scrollView.zz_width * 2, y: 0, width: scrollView.zz_width, height: scrollView.zz_height)
        scrollView.addSubview(transferListController.view)
    }
    
    private func setSegView() {
        let topView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.zz_width, height: hxb.length.navigationHeight - hxb.length.statusBarHeight))
        topView.backgroundColor = .clear
        view.addSubview(topView)
        
        let tempView = UIView(frame: CGRect(x: 0, y: -hxb.length.statusBarHeight, width: UIScreen.zz_width, height: hxb.length.statusBarHeight))
        tempView.backgroundColor = .clear
        topView.addSubview(tempView)
        
        segView.items = ["红利智投", "散标", "债权转让"]
        segView.itemSelectedColor = hxb.color.theme
        segView.itemNormalColor = hxb.color.important
        segView.itemHighlightColor = hxb.color.theme
        segView.itemFont = hxb.font.f15
        segView.sepLineColor = .clear
        segView.animateLineWidth = 28
        segView.animateLineHeight = 3
        segView.animateLineColor = hxb.color.theme
        
        topView.addSubview(segView)
        
        segView.itemSelect = { index, title in
            self.scrollView.contentOffset.x = CGFloat(index) * self.scrollView.zz_width
        }
        
        let bottomLine = UIView()
        bottomLine.backgroundColor = hxb.color.background
        segView.insertSubview(bottomLine, belowSubview: segView.animateLine)
        
        navigationController?.navigationBar.addSubview(topView)
        
        segView.snp.makeConstraints { maker in
            maker.bottom.left.right.equalToSuperview()
            maker.top.equalTo(tempView.snp.bottom)
        }
        
        bottomLine.snp.makeConstraints { maker in
            maker.bottom.left.right.equalToSuperview()
            maker.height.equalTo(2)
        }
    }
}

extension HXBInvestController: UIScrollViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        segView.selectedIndex = Int(round(scrollView.contentOffset.x / scrollView.zz_width))
    }
}
