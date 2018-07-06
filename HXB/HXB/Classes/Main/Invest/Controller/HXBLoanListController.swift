//
//  HXBLoanListController.swift
//  HXB
//
//  Created by lxz on 2018/7/5.
//Copyright © 2018年 lixiangzhou. All rights reserved.
//

import UIKit
import ReactiveSwift
import XZLib

/// 散标列表
class HXBLoanListController: HXBViewController {

    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel = HXBLoanListViewModel(view)
        setUI()
        viewModel.getData(isNew: true)
        reactive_bind()
    }

    // MARK: - Public Property
    
    // MARK: - Private Property
    fileprivate var tableView = HXBTableView(style: .plain, dataSource: nil, delegate: nil)
    fileprivate var viewModel: HXBLoanListViewModel!
}

// MARK: - UI
extension HXBLoanListController {
    fileprivate func setUI() {
        view.backgroundColor = UIColor.orange
        tableView.dataSource = self
        
        tableView.register(HXBLoanListCell.self, forCellReuseIdentifier: HXBLoanListCell.identifier)
        tableView.rowHeight = HXBLoanListCell.cellHeight
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { maker in
            maker.top.equalToSuperview().offset(view.safeAreaInsets.top)
            maker.left.right.equalToSuperview()
            maker.bottom.equalToSuperview().offset(view.safeAreaInsets.bottom)
        }
        
        tableView.header = HXBRefreshHeader(target: self, action: #selector(getNewData))
        tableView.footer = HXBRefreshFooter(target: self, action: #selector(getMoreData))
    }
    
    override func reactive_bind() {
        viewModel.reloadDataSignal.observeValues { [weak self] in
            self?.tableView.reloadData()
            self?.tableView.header?.endRefreshing()
            self?.tableView.footer?.endRefreshing()
        }
    }
}

extension HXBLoanListController {
    @objc fileprivate func getNewData() {
        viewModel.getData(isNew: true)
    }
    
    @objc fileprivate func getMoreData() {
        viewModel.getData(isNew: false)
    }
}

// MARK: - Delegate Internal

// MARK: -
extension HXBLoanListController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HXBLoanListCell.identifier, for: indexPath) as! HXBLoanListCell
        cell.loanListModel = viewModel.dataSource[indexPath.row]
        return cell
    }
}


