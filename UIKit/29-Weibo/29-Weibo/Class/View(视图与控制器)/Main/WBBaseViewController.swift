//
//  WBBaseViewController.swift
//  29-Weibo
//
//  Created by 何强 on 2019/12/5.
//  Copyright © 2019 何强. All rights reserved.
//

import UIKit

class WBBaseViewController: UIViewController {
    
    var vistorInfoDictionary: [String: String]?
    
    var tableView: UITableView?
    
    var refreshControl: CZRefreshControl?
    var isPullup = false
    
    
    
    lazy var navigationBar = NavigationBar.init(frame: .init(x: 0, y: 0, width: UIScreen.cz_screenWidth(), height: 64))
    
    lazy var navItem = UINavigationItem.init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setupUI()
        
        WBNetworkManager.shared.userLogin ? loadData() : ()
        
        NotificationCenter.default.addObserver(self, selector: #selector(loginSuccess), name: Notification.Name(rawValue: WBUserLoginSuccessedNotification), object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    
    override var title: String? {
        didSet {
            navItem.title = title
        }
    }
    
    @objc func loadData() {
        refreshControl?.endRefreshing()
    }
   
    
}

extension WBBaseViewController {
    @objc fileprivate func loginSuccess(n: Notification) {
        print("登录成功 \(n)")
        
        navItem.leftBarButtonItem = nil
        
        navItem.rightBarButtonItem = nil
        
        view = nil
        
        NotificationCenter.default.removeObserver(self)
    }
    

    @objc fileprivate func login() {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: WBUserShouldLoginNotification), object: nil)
    }
                 
    @objc fileprivate func register() {
        print("用户注册")
    }
    
}

extension WBBaseViewController {
    @objc func setupUI() {
        view.backgroundColor = UIColor.cz_random()
//        navigationBar.barTintColor = UIColor.cz_color(withHex: 0xF6F6F6)
////        navigationBar.isTranslucent = true
////        navigationBar.setBackgroundImage(nil, for: .default)
//        view.addSubview(navigationBar)
//        navigationBar.items = [navItem]
//        navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.darkGray]
//        navigationBar.tintColor = .orange
       
        if #available(iOS 11.0, *) {
            tableView?.contentInsetAdjustmentBehavior  = .never;
            
        } else {
            automaticallyAdjustsScrollViewInsets = false
        }
        
        setupNavigationBar()
        WBNetworkManager.shared.userLogin ? setupTableView() : setupVisitorView()
        
    }
    
   @objc func setupTableView() {
        tableView = UITableView.init(frame: view.bounds, style: .plain)
        
        view.insertSubview(tableView!, belowSubview: navigationBar)
        
        tableView?.delegate = self
        tableView?.dataSource = self
        
        tableView?.contentInset = UIEdgeInsets.init(top: navigationBar.bounds.height, left: 0, bottom: tabBarController?.tabBar.bounds.height ?? 49 , right: 0)
        
        tableView?.scrollIndicatorInsets = tableView!.contentInset
        
        refreshControl = CZRefreshControl()
        tableView?.addSubview(refreshControl!)
        refreshControl?.addTarget(self, action: #selector(loadData), for: .valueChanged)
    }
    
    private func setupVisitorView() {
        let visitorView = WBVisitorView(frame: view.bounds)
        view.insertSubview(visitorView, belowSubview: navigationBar)
        
        visitorView.visitorInfo = vistorInfoDictionary
        visitorView.loginButton.addTarget(self, action: #selector(login), for: .touchUpInside)
        visitorView.registerButton.addTarget(self, action: #selector(register), for: .touchUpInside)
        
        navItem.leftBarButtonItem = UIBarButtonItem.init(title: "注册", style: .plain, target: self, action: #selector(register))
        navItem.rightBarButtonItem = UIBarButtonItem.init(title: "登录", style: .plain, target: self, action: #selector(login))
    }
    
    private func setupNavigationBar() {
        view.addSubview(navigationBar)
        navigationBar.items = [navItem]
        navigationBar.barTintColor = UIColor.cz_color(withHex: 0xF6F6F6)
        navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.darkGray]
        navigationBar.tintColor = .orange
    }
    
   
}

extension WBBaseViewController: UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
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
        return 10
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

class NavigationBar: UINavigationBar {
    private var is_iPhone_X: Bool {
        return UIScreen.main.bounds.size.height >= 812 ? true : false
    }
    override func layoutSubviews() {
        super .layoutSubviews()
        
//        let systemVersion:Double = UIDevice.current.systemVersion
//        if systemVersion < 11.0 {
//            return
//        }
        if #available(iOS 11, *) {
            
        } else {
            return
        }
        
        for view in subviews {
                var frame = view.frame
                
                if NSStringFromClass(type(of: view)).lowercased().contains("background".lowercased()) {
                    frame.size.height = 64
                    if is_iPhone_X { frame.origin.y = 24 }
                }
                
                if NSStringFromClass(type(of: view)).lowercased().contains("contentView".lowercased()) {
                    frame.origin.y = 20
                    if is_iPhone_X { frame.origin.y = 44 }
                    
                    if #available(iOS 13, *) {
                        let margins: UIEdgeInsets = view.layoutMargins
                        view.frame = CGRect.init(x: -margins.left, y: -margins.top, width: margins.left + margins.right + view.frame.size.width, height: margins.top + margins.bottom + view.frame.size.height)
                    } else {
//                        view.layoutMargins = UIEdgeInsets.init(top: 0, left: 2, bottom: 0, right: 2)
                        view.layoutMargins = UIEdgeInsets.zero
                    }
                }
                view.frame = frame
            }
    }
}

