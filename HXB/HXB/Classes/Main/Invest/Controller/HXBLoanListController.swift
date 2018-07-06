//
//  HXBLoanListController.swift
//  HXB
//
//  Created by lxz on 2018/7/5.
//Copyright © 2018年 lixiangzhou. All rights reserved.
//

import UIKit
import ReactiveSwift

/// 散标列表
class HXBLoanListController: HXBViewController {

    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel = HXBLoanListViewModel(view)
        setUI()
        viewModel.getData(isNew: true)
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
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "id")
        
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { maker in
            maker.top.equalToSuperview().offset(view.safeAreaInsets.top)
            maker.left.right.equalToSuperview()
            maker.bottom.equalToSuperview().offset(view.safeAreaInsets.bottom)
        }
    }
    
    override func reactive_bind() {
        tableView.reactive.reloadData <~ viewModel.reloadDataSignal
    }
}

// MARK: - Delegate Internal

// MARK: -
extension HXBLoanListController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "id", for: indexPath)
        cell.backgroundColor = UIColor.cyan
        cell.textLabel?.text = viewModel.dataSource[indexPath.row].title
        return cell
    }
}


