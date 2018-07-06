//
//  HXBPlanListController.swift
//  HXB
//
//  Created by lxz on 2018/7/5.
//Copyright © 2018年 lixiangzhou. All rights reserved.
//

import UIKit

/// 计划列表
class HXBPlanListController: HXBViewController {

    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel = HXBPlanListViewModel(view)
        setUI()
    }

    // MARK: - Public Property
    
    // MARK: - Private Property
    fileprivate var tableView = HXBTableView(style: .plain, dataSource: nil, delegate: nil)
    fileprivate var viewModel: HXBPlanListViewModel!
}

// MARK: - UI
extension HXBPlanListController {
    fileprivate func setUI() {
        view.backgroundColor = UIColor.blue
        
        tableView.dataSource = self
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "id")
        
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { maker in
            maker.top.equalToSuperview().offset(view.safeAreaInsets.top)
            maker.left.right.equalToSuperview()
            maker.bottom.equalToSuperview().offset(view.safeAreaInsets.bottom)
        }
    }
}

// MARK: - Action
extension HXBPlanListController {
    
}

// MARK: - Network
extension HXBPlanListController {
    
}

// MARK: - Delegate Internal

// MARK: -
extension HXBPlanListController: UITableViewDataSource {

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "id", for: indexPath)
        cell.backgroundColor = UIColor.cyan
        cell.textLabel?.text = "item + \(indexPath.row)"
        return cell
    }
}

// MARK: - Delegate External

// MARK: -

// MARK: - Helper
extension HXBPlanListController {
    
}

// MARK: - Other
extension HXBPlanListController {
    
}

// MARK: - Public
extension HXBPlanListController {
    
}
