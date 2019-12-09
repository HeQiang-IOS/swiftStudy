//
//  WBHomeViewController.swift
//  29-Weibo
//
//  Created by 何强 on 2019/12/5.
//  Copyright © 2019 何强. All rights reserved.
//

import UIKit

private let originalCellId = "originalCellId"

private let retweetedCellId = "retweetedCellId"

class WBHomeViewController: WBBaseViewController {
    
    fileprivate lazy var listViewModel = WBStatusListViewModel()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        NotificationCenter.default.addObserver(self, selector: #selector(brwoserPhoto), name: NSNotification.Name(rawValue: WBStatusCellBrowserPhotoNotification), object: nil)
    }
    @objc private func showFriends () {
        print("friends")
        let vc = WBTestViewController()
        vc.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(vc, animated: true)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    override func loadData() {
        refreshControl?.beginRefreshing()
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
            self.listViewModel.loadStatus(pullup: self.isPullup) { (isSuccess, shouldRefresh) in
                
                self.refreshControl?.endRefreshing()
                
                self.isPullup = false
                
                if shouldRefresh {
                    self.tableView?.reloadData()
                }
            }
        }
    }
    
    @objc private func brwoserPhoto(n: Notification) {
        
    }
}



extension WBHomeViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listViewModel.statusList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let vm = listViewModel.statusList[indexPath.row]
        
        let cellId = (vm.status.retweeted_status != nil) ? retweetedCellId : originalCellId
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! WBStatusCell
        
        cell.viewModel = vm
        
        cell.delegate = self
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let vm = listViewModel.statusList[indexPath.row]
        return vm.rowHeight
        
    }
}

extension WBHomeViewController: WBStatusCellDelegate {
    func statusCellDidSelectedURLString(cell: WBStatusCell, urlString: String) {
        let vc = WBTestViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}


extension WBHomeViewController {
    override func setupTableView() {
        super.setupTableView()
        tableView?.register(UINib.init(nibName: "WBStatusNormalCell", bundle: nil), forCellReuseIdentifier: originalCellId)
        tableView?.register(UINib.init(nibName: "WBStatusRetweetedCell", bundle: nil), forCellReuseIdentifier: originalCellId)
        
        tableView?.estimatedRowHeight = 300
        tableView?.separatorStyle = .none
        setupNavTitle()
    }
    
    func setupNavTitle()  {
        let title = WBNetworkManager.shared.userAccount.screen_name
        
        let button = WBTitleButton(title: title)
        
        navItem.titleView = button
        
        button.addTarget(self, action: #selector(clickTitleButton), for: .touchUpInside)
    }
    
    @objc func clickTitleButton(btn: UIButton) {
        btn.isSelected = !btn.isSelected
    }
}

extension WBHomeViewController {
    override func setupUI() {
        super.setupUI()
//        navigationItem.leftBarButtonItem = UIBarButtonItem.init(title: "好友", style: .plain, target: self, action: #selector(showFriends))
        let btn:UIButton = UIButton.cz_textButton("好友", fontSize: 16, normalColor: UIColor.darkGray, highlightedColor: UIColor.orange)
        btn.addTarget(self, action: #selector(showFriends), for: .touchUpInside)
        
        navItem.leftBarButtonItem = UIBarButtonItem.init(customView: btn)
    }
}
