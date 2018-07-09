//
//  HXBTransferListController.swift
//  HXB
//
//  Created by lxz on 2018/7/5.
//Copyright © 2018年 lixiangzhou. All rights reserved.
//

import UIKit

/// 债权转让列表
class HXBTransferListController: HXBViewController {
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = HXBTransferListViewModel(view)
        setUI()
        viewModel.getData(isNew: true)
        reactive_bind()
    }
    
    // MARK: - Public Property
    
    // MARK: - Private Property
    fileprivate var tableView = HXBTableView(style: .plain, dataSource: nil, delegate: nil)
    fileprivate var viewModel: HXBTransferListViewModel!
}

// MARK: - UI
extension HXBTransferListController {
    fileprivate func setUI() {
        view.backgroundColor = UIColor.orange
        tableView.dataSource = self
        
        tableView.register(HXBTransferListCell.self, forCellReuseIdentifier: HXBTransferListCell.identifier)
        tableView.rowHeight = HXBLoanListCell.cellHeight
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { maker in
            maker.top.equalToSuperview().offset(view.safeAreaInsets.top)
            maker.left.right.equalToSuperview()
            maker.bottom.equalToSuperview().offset(view.safeAreaInsets.bottom)
        }
        
        tableView.header = HXBRefreshHeader(target: self, action: #selector(getNewData))
        
    }
    
    override func reactive_bind() {
        viewModel.reloadDataSignal.observeValues { [weak self] in
            self?.tableView.reloadData()
            self?.tableView.header?.endRefreshing()
            self?.tableView.footer?.endRefreshing()
            
            if self?.viewModel.footerType == .moreData {
                if !(self?.tableView.footer != nil && self!.tableView.footer!.loadNoMoreData == false) {
                    self?.tableView.footer = HXBRefreshFooter(target: self, action: #selector(HXBTransferListController.getMoreData))
                }
            } else if self?.viewModel.footerType == .nomoreData {
                if !(self?.tableView.footer != nil && self!.tableView.footer!.loadNoMoreData == true) {
                    self?.tableView.footer = HXBRefreshNoMoreDataFooter()
                }
            } else if self?.viewModel.footerType == .none {
                self?.tableView.footer = nil
            }
        }
    }
}

extension HXBTransferListController {
    @objc fileprivate func getNewData() {
        viewModel.getData(isNew: true)
    }
    
    @objc fileprivate func getMoreData() {
        viewModel.getData(isNew: false)
    }
}

// MARK: - Delegate Internal

// MARK: -
extension HXBTransferListController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HXBTransferListCell.identifier, for: indexPath) as! HXBTransferListCell
        cell.listTransferModel = viewModel.dataSource[indexPath.row]
        return cell
    }
}


