//
//  HXBSegView.swift
//  HXB
//
//  Created by lxz on 2018/7/5.
//Copyright © 2018年 lixiangzhou. All rights reserved.
//

import UIKit

class HXBSegView: UIView {
    
    // MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public Property
    var items: [String] = [String]() {
        didSet {
            if items.count > 1 {
                clearItemViews()
                clearSepLines()
                makeItemViews()
                makeSepLines()
                if selectedIndex < itemViews.count {
                    selectedItem = itemViews[selectedIndex]
                } else {
                    selectedItem = itemViews[0]
                }
                itemClick(sender: selectedItem)
            } else {
                assertionFailure("Item must more than 1")
            }
        }
    }
    
    var itemSelectedColor: UIColor? {
        didSet {
            for btn in itemViews {
                btn.setTitleColor(itemSelectedColor, for: .selected)
            }
        }
    }
    var itemNormalColor: UIColor? {
        didSet {
            for btn in itemViews {
                btn.setTitleColor(itemNormalColor, for: .normal)
            }
        }
    }
    
    var itemHighlightColor: UIColor? {
        didSet {
            for btn in itemViews {
                btn.setTitleColor(itemHighlightColor, for: .highlighted)
            }
        }
    }
    
    var itemFont: UIFont = UIFont.systemFont(ofSize: 17) {
        didSet {
            for btn in itemViews {
                btn.titleLabel?.font = itemFont
            }
        }
    }
    
    var selectedIndex = 0
    
    // MARK: Item 间的分割线
    var sepLineColor: UIColor? {
        didSet {
            for line in sepLines {
                line.backgroundColor = sepLineColor
            }
        }
    }
    
    var sepLineHeight: CGFloat = 30 {
        didSet {
            for line in sepLines {
                line.snp.updateConstraints { maker in
                    maker.height.equalTo(sepLineHeight)
                }
            }
            setNeedsLayout()
        }
    }
    
    var sepLineWidth: CGFloat = 0.5 {
        didSet {
            for line in sepLines {
                line.snp.updateConstraints { maker in
                    maker.width.equalTo(sepLineWidth)
                }
            }
            setNeedsLayout()
        }
    }
    
    // MARK: 底部动画的线
    var animateLineColor: UIColor? {
        didSet {
            animateLine.backgroundColor = animateLineColor
        }
    }
    
    var animateLineHeight: CGFloat = 1 {
        didSet {
            animateLine.snp.updateConstraints { maker in
                maker.height.equalTo(animateLineHeight)
            }
        }
    }
    
    var animateLineWidth: CGFloat = 0 {
        didSet {
            animateLine.snp.updateConstraints { maker in
                maker.width.equalTo(animateLineWidth)
            }
        }
    }
    
    var animateLineWidthAsItem: Bool = false {
        didSet {
            let width = selectedItem.currentTitle!.zz_size(withLimitWidth: 200, fontSize: selectedItem.titleLabel!.font.lineHeight).width
            animateLine.snp.updateConstraints { maker in
                maker.width.equalTo(width)
            }
        }
    }
    
    var animateLinePaddingBottom: CGFloat = 0 {
        didSet {
            animateLine.snp.updateConstraints { maker in
                maker.bottom.equalTo(animateLinePaddingBottom)
            }
        }
    }
    
    var animateLineAnimateDuration: TimeInterval = 0.25
    let animateLine = UIView()
    // MARK:
    var itemSelect: ((Int, String) -> Void)?
    
    // MARK: - Private Property
    fileprivate var itemViews = [UIButton]()
    fileprivate var sepLines = [UIView]()
    
    fileprivate var selectedItem: UIButton! {
        didSet {
            for btn in itemViews {
                btn.isSelected = selectedItem == btn
            }
        }
    }
}

// MARK: - UI
extension HXBSegView {
    fileprivate func setUI() {
        addSubview(animateLine)
        animateLine.snp.makeConstraints { maker in
            maker.bottom.equalTo(0)
            maker.width.equalTo(0)
            maker.height.equalTo(0)
            maker.left.equalTo(0)
        }
    }
    
    override func willMove(toSuperview newSuperview: UIView?) {
        super.willMove(toSuperview: newSuperview)
        
        if newSuperview != nil {        
            bringSubview(toFront: animateLine)
            
            DispatchQueue.main.async {
                self.animateLine.snp.updateConstraints { maker in
                    maker.left.equalTo(self.selectedItem.center.x - self.animateLineWidth * 0.5)
                }
                self.layoutIfNeeded()
            }
        }
    }
}

// MARK: - Action
extension HXBSegView {
    @objc fileprivate func itemClick(sender: UIButton) {
        if sender == selectedItem {
            return
        }
        
        sender.isSelected = true
        selectedItem.isSelected = false
        selectedItem = sender
        
        animateLine.snp.updateConstraints { maker in
            maker.left.equalTo(sender.center.x - animateLineWidth * 0.5)
        }
        
        UIView.animate(withDuration: animateLineAnimateDuration) {
            self.layoutIfNeeded()
        }
        
        itemSelect?(itemViews.index(of: sender)!, sender.currentTitle!)
    }
}

// MARK: - Helper
extension HXBSegView {
    fileprivate func clearItemViews() {
        if itemViews.count > 0 {
            for btn in itemViews {
                btn.removeFromSuperview()
            }
        }
    }
    
    fileprivate func clearSepLines() {
        if sepLines.count > 0 {
            for line in sepLines {
                line.removeFromSuperview()
            }
        }
    }
    
    fileprivate func makeItemViews() {
        var lastBtn: UIButton!
        for (idx, item) in items.enumerated() {
            let btn = UIButton()
            
            btn.setTitleColor(itemSelectedColor, for: .selected)
            btn.setTitleColor(itemNormalColor, for: .normal)
            btn.setTitleColor(itemHighlightColor, for: .normal)
            btn.titleLabel?.font = itemFont
            
            btn.addTarget(self, action: #selector(itemClick), for: .touchUpInside)
            
            btn.setTitle(item, for: .normal)
            
            addSubview(btn)
            itemViews.append(btn)
            
            if idx == 0 {
                btn.snp.makeConstraints { maker in
                    maker.left.top.bottom.equalToSuperview()
                }
                lastBtn = btn
            } else if idx == items.count - 1 {
                btn.snp.makeConstraints { maker in
                    maker.right.top.bottom.equalToSuperview()
                    maker.left.equalTo(lastBtn.snp.right)
                    maker.width.equalTo(lastBtn)
                }
            } else {
                btn.snp.makeConstraints { maker in
                    maker.top.bottom.equalToSuperview()
                    maker.left.equalTo(lastBtn.snp.right)
                    maker.width.equalTo(lastBtn)
                }
                lastBtn = btn
            }
        }
    }
    
    fileprivate func makeSepLines() {
        for (idx, btn) in itemViews.enumerated() {
            if idx != itemViews.count - 1 {
                let sepLine = UIView()
                sepLine.backgroundColor = sepLineColor
                
                btn.addSubview(sepLine)
                sepLines.append(sepLine)
                
                sepLine.snp.makeConstraints { maker in
                    maker.centerY.equalToSuperview()
                    maker.width.equalTo(sepLineWidth)
                    maker.height.equalTo(sepLineHeight)
                    maker.centerX.equalTo(btn.snp.right)
                }
            }
        }
    }
}

// MARK: - Other
extension HXBSegView {
    
}

// MARK: - Public
extension HXBSegView {
    
}
