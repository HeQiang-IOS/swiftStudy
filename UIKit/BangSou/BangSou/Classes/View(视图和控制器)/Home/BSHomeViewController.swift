//
//  BSHomeViewController.swift
//  BangSou
//
//  Created by 何强 on 2019/12/9.
//  Copyright © 2019 何强. All rights reserved.
//

import UIKit


private let rankCellId = "BSRankCellId"

class BSHomeViewController: BSBaseViewController {
    
    fileprivate lazy var hostlistViewModel = BSRankDetailListViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        hostlistViewModel.loadHostlistData(pullup: true) { (isSuccess, shouldRefresh) in
            print("11")
            self.refreshControl?.endRefreshing()
            self.isPullup = false
            
            if isSuccess {
                self.tableView?.reloadData()
            }
        }
    }
}

extension BSHomeViewController {
    override func setupTableView() {
        super.setupTableView()
        tableView?.register(UINib.init(nibName: "BSRankCell", bundle: nil), forCellReuseIdentifier: rankCellId)
        tableView?.estimatedRowHeight = 80
        tableView?.separatorStyle = .none
    }
}

extension BSHomeViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hostlistViewModel.hostList.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let vm = hostlistViewModel.hostList[indexPath.row]
        print(vm.inlineModel.name)
        
        let cell = tableView.dequeueReusableCell(withIdentifier: rankCellId, for: indexPath) as! BSRankCell
        
        cell.bsViewModel = vm
        
        return cell 
    }
}
