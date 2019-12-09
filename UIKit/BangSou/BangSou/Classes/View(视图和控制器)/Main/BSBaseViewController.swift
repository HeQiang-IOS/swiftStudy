//
//  BSBaseViewController.swift
//  BangSou
//
//  Created by 何强 on 2019/12/9.
//  Copyright © 2019 何强. All rights reserved.
//

import UIKit

class BSBaseViewController: UIViewController {

    var tableView: UITableView?
       
    var refreshControl: CZRefreshControl?
    var isPullup = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    @objc func loadData() {
           refreshControl?.endRefreshing()
    }
      
}


extension BSBaseViewController {
    @objc func setupUI() {
        view.backgroundColor = .white
        setupTableView()
        
    }
    
    @objc func setupTableView() {
        tableView = UITableView.init(frame: view.bounds, style: .plain)
        view.addSubview(tableView ?? UIView())
        
        tableView?.delegate = self
        tableView?.dataSource = self
        
//        tableView?.contentInset
        refreshControl = CZRefreshControl()
        
        tableView?.addSubview(refreshControl!)
         refreshControl?.addTarget(self, action: #selector(loadData), for: .valueChanged)
        
    }
}

extension BSBaseViewController: UITableViewDelegate , UITableViewDataSource {
func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 10
}
func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    return UITableViewCell()
}

func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
    return 0.1
}

func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return 0.1
}

func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 44
}

func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
    let row = indexPath.row
    let section = tableView.numberOfSections - 1
    if row < 0 || section < 0 {
        return
    }
    
    let count = tableView.numberOfRows(inSection: section)
    
    if row == (count - 1) && !isPullup {
        print("上拉刷新")
        isPullup = true
        loadData()
    }
}
}
