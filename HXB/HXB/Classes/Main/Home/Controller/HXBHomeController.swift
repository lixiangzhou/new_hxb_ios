//
//  HXBHomeController.swift
//  HXB
//
//  Created by lxz on 2018/6/29.
//  Copyright © 2018年 lixiangzhou. All rights reserved.
//

import UIKit

class HXBHomeController: HXBViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel = HXBHomeViewModel(view)
        setUI()
        reactive_bind()
        viewModel.getData()
    }

    // MARK: - Private Property
    fileprivate let msgDot = UIView()
    fileprivate var tableView = HXBTableView(style: .plain, dataSource: nil, delegate: nil)
    fileprivate var viewModel: HXBHomeViewModel!
    fileprivate weak var headerView: HXBHomeHeaderView!
}

// MARK: - UI
extension HXBHomeController {
    fileprivate func setUI() {
        backItemStyle = .none
        navigationBarBackgroundStyle = .white
        
        setNavigationViews()
        
        tableView.register(HXBHomePlanCell.self, forCellReuseIdentifier: HXBHomePlanCell.identifier)
        tableView.register(HXBHomeNewPlanCell.self, forCellReuseIdentifier: HXBHomeNewPlanCell.identifier)
        tableView.estimatedRowHeight = 135
        tableView.dataSource = self
        tableView.delegate = self
        tableView.sectionHeaderHeight = 42
        view.addSubview(tableView)
        
        let headerView = HXBHomeHeaderView(frame: CGRect(x: 0, y: 0, width: UIScreen.zz_width, height: 200))
        tableView.tableHeaderView = headerView
        self.headerView = headerView
        
        
        tableView.snp.makeConstraints { maker in
            maker.top.equalToSuperview().offset(view.safeAreaInsets.top)
            maker.left.right.equalToSuperview()
            maker.bottom.equalToSuperview().offset(view.safeAreaInsets.bottom)
        }
        
        tableView.header = HXBRefreshHeader(target: viewModel, action: #selector(HXBHomeViewModel.getData))
    }
    
    private func setNavigationViews() {
        let titleLabel = UILabel(text: "红小宝", font: hxb.font.f19, textColor: hxb.color.important)
        let titleItem = UIBarButtonItem(customView: titleLabel)
        navigationItem.leftBarButtonItem = titleItem
        
        let msgBtn = UIButton(imageName: "home_message", target: nil, action: nil)
        msgBtn.imageView?.contentMode = .scaleAspectFill
        msgDot.backgroundColor = UIColor(stringHexValue: "FF48AF")
        msgDot.layer.cornerRadius = 2.5
        msgDot.layer.masksToBounds = true
        msgBtn.addSubview(msgDot)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: msgBtn)
        
        msgDot.snp.makeConstraints { maker in
            maker.top.equalToSuperview()
            maker.right.equalToSuperview().offset(3)
            maker.width.height.equalTo(5)
        }
    }
    
    override func reactive_bind() {
        viewModel.reloadDataSignal.observeValues { [weak self] in
            self?.tableView.reloadData()
            self?.tableView.header?.endRefreshing()
            self?.headerView.bannerList = self?.viewModel.bannerList
        }
    }
}

// MARK: - Delegate Internal

// MARK: -
extension HXBHomeController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let model = viewModel.dataSource[section]
        
        let headerView = UIView()
        headerView.backgroundColor = UIColor.white
        let textLabel = UILabel(text: model.type.rawValue, font: UIFont.boldSystemFont(ofSize: 17), textColor: hxb.color.important)
        headerView.addSubview(textLabel)
        
        textLabel.snp.makeConstraints { maker in
            maker.left.equalTo(hxb.length.edgeScreen)
            maker.bottom.equalTo(-7)
        }
        return headerView
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.dataSource.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.dataSource[section].dataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let groupModel = viewModel.dataSource[indexPath.section]
        let cellViewModel = groupModel.dataList[indexPath.row]
        
        switch groupModel.type {
        case .new:
            let cell = tableView.dequeueReusableCell(withIdentifier: HXBHomeNewPlanCell.identifier, for: indexPath) as! HXBHomeNewPlanCell
            cell.cellViewModel = cellViewModel
            return cell
        case .recomend:
            let cell = tableView.dequeueReusableCell(withIdentifier: HXBHomePlanCell.identifier, for: indexPath) as! HXBHomePlanCell
            cell.cellViewModel = cellViewModel
            return cell
        }
        
    }
}

