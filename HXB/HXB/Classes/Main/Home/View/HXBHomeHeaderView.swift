//
//  HXBHomeHeaderView.swift
//  HXB
//
//  Created by lxz on 2018/7/12.
//Copyright © 2018年 lixiangzhou. All rights reserved.
//

import UIKit
import CHIPageControl

class HXBHomeHeaderView: UIView {
    
    // MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public Property
    var bannerList: [HXBHomeBannerModel]? {
        didSet {
            guard let bannerList = bannerList else {
                return
            }
            bannerCount = bannerList.count <= 1 ? 2 : bannerList.count
            pageControl.numberOfPages = bannerCount
            collectionView.reloadData()
        }
    }
    
    // MARK: - Private Property
    fileprivate var collectionView: UICollectionView!
    fileprivate var pageControl: CHIPageControlAleppo!
    fileprivate var timer: Timer?
    fileprivate var layout: MMBannerLayout!
    fileprivate var bannerCount = 2
}

// MARK: - UI
extension HXBHomeHeaderView {
    fileprivate func setUI() {
        backgroundColor = UIColor.white
        
        setBannerView()
    }
    
    private func setBannerView() {
        let width: CGFloat = 330
        let space: CGFloat = 10
        let offsetX = UIScreen.zz_width - width - space * 2
        let rect = CGRect(x: -offsetX, y: 6, width: UIScreen.zz_width + offsetX, height: 160)
        layout = MMBannerLayout()
        layout.itemSpace = space
        layout.itemSize = CGSize(width: width, height: rect.height)
        
        collectionView = UICollectionView(frame: rect, collectionViewLayout: layout)
        collectionView.register(HXBHomeHeaderCell.self, forCellWithReuseIdentifier: HXBHomeHeaderCell.identifier)
        collectionView.backgroundColor = UIColor.white
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.dataSource = self
        collectionView.delegate = self
        addSubview(collectionView)
        
        pageControl = CHIPageControlAleppo()
        pageControl.currentPageTintColor = UIColor.white
        pageControl.numberOfPages = bannerCount
        pageControl.padding = 5
        pageControl.radius = 2.5
        pageControl.tintColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.5)
        addSubview(pageControl)
        
        pageControl.snp.makeConstraints { maker in
            maker.bottom.equalTo(collectionView).offset(-10)
            maker.centerX.equalToSuperview()
            maker.height.equalTo(5)
        }
        
        layout.setInfinite(isInfinite: true, completed: nil)
        
        startTimer()
    }
}

// MARK: - Action
extension HXBHomeHeaderView {
    @objc fileprivate func repeatAction() {
        guard let indexPath = layout.focusIndexPath else {
            return
        }
        
        if indexPath.item >= bannerCount - 1 {
            collectionView.scrollToItem(at: IndexPath(item: 0, section: 0), at: .centeredHorizontally, animated: true)
        } else {
            collectionView.scrollToItem(at: IndexPath(item: indexPath.item + 1, section: indexPath.section), at: .centeredHorizontally, animated: true)
        }
    }
}

// MARK: - Helper
extension HXBHomeHeaderView {
    @objc private func startTimer() {
        stopTimer()
        timer = Timer.zz_scheduledTimer(timeInterval: 3, target: self, selector: #selector(repeatAction), userInfo: nil, repeats: true)
    }
    
    fileprivate func stopTimer() {
        timer?.invalidate()
    }
    
}

// MARK: - Delegate
// MARK: - UICollectionViewDataSource
extension HXBHomeHeaderView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bannerCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HXBHomeHeaderCell.identifier, for: indexPath) as! HXBHomeHeaderCell
        
        // 以下代码仅仅是为了适应 MMBannerLayout
        if bannerCount == 2 {
            if let bannerList = bannerList {
                if bannerList.count == 1 {
                    cell.banner = bannerList[0]
                } else if bannerList.count == 2 {
                    cell.banner = bannerList[indexPath.item]
                }
            }
        } else {
            cell.banner = bannerList![indexPath.item]
        }
        
        
        return cell
    }
}

extension HXBHomeHeaderView: BannerLayoutDelegate {
    func collectionView(_ collectionView: UICollectionView, focusAt indexPath: IndexPath) {
        print("Focus At \(indexPath)")
        pageControl.set(progress: indexPath.item, animated: true)
    }
    
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        stopTimer()
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        startTimer()
    }
}

// MARK: - Public
extension HXBHomeHeaderView {
    
}
