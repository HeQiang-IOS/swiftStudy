//
//  WBMainViewController.swift
//  29-Weibo
//
//  Created by 何强 on 2019/12/5.
//  Copyright © 2019 何强. All rights reserved.
//

import UIKit
import SVProgressHUD

class WBMainViewController: UITabBarController {
    
    private var timer: Timer?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupChildControllers()
        setupComposeButton()
        setupTimer()
        
        setupNewfeatureViews()
        
        delegate = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(userLogin), name: NSNotification.Name(rawValue: WBUserShouldLoginNotification), object: nil)
        // Do any additional setup after loading the view.
    }
    
    deinit {
        timer?.invalidate()
        NotificationCenter.default.removeObserver(self)
    }
    
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    
    private lazy var composeButton: UIButton = UIButton.cz_imageButton("tabbar_compose_icon_add", backgroundImageName: "tabbar_compose_button")
    
    @objc private func composeStatus(){
        print("编写博客")
    }
    
    @objc private func userLogin(n: Notification) {
        print("用户登录通知 \(n)")
        
        var when = DispatchTime.now()
        
        if n.object != nil {
            SVProgressHUD.setDefaultMaskType(.gradient)
            SVProgressHUD.showInfo(withStatus: "用户登录已经超时，需要重新登录")
            
            when = DispatchTime.now() + 2
        }
        
        DispatchQueue.main.asyncAfter(deadline: when) {
            SVProgressHUD.setDefaultMaskType(.clear)
            let nav = UINavigationController.init(rootViewController: WBTestViewController())
            self.present(nav, animated: true, completion: nil)
        }
    }
    
   
}

extension WBMainViewController {
    
    private func setupComposeButton() {
        tabBar.addSubview(composeButton)
        
        let count = CGFloat(children.count)
        let w = tabBar.bounds.width / count - 1
        
        composeButton.frame = tabBar.bounds.insetBy(dx: 2*w, dy: 0)
        composeButton.addTarget(self, action: #selector(composeStatus), for: .touchUpInside)
    }
    
    private func setupChildControllers() {
//        let array = [
//            ["clsName": "WBHomeViewController", "title": "首页", "imgName": "home"],
//            ["clsName": "WBMessageViewController", "title": "消息", "imgName": "message_center"],
//            ["clsName":"UIViewController"],
//            ["clsName": "WBDiscoverViewController", "title": "发现", "imgName": "discover"],
//            ["clsName": "WBProfileViewController", "title": "我", "imgName": "profile"]
//        ]
        let docDir = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        
        let jsonPath = (docDir as NSString).appendingPathComponent("main.json")
        
        var data = NSData.init(contentsOfFile: jsonPath)
        
        if data == nil {
            let path = Bundle.main.path(forResource: "main.json", ofType: nil)
            data = NSData.init(contentsOfFile: path!)
        }
        
        guard let array = try? JSONSerialization.jsonObject(with: data! as Data, options: []) as? [[String: AnyObject]] else {
            return
        }
        
        
        
        var arrayM = [UIViewController]()
        
        for dict in array {
            arrayM.append(controller(dict: dict))
        }
        viewControllers = arrayM
    }
    
    private func controller(dict: [String: AnyObject]) -> UIViewController {
        print(Bundle.main.namespace)
        
       guard let clsName = dict["clsName"] as? String,
        let title = dict["title"] as? String,
        let imgName = dict["imageName"] as? String,
        let visitorDict = dict["visitorInfo"] as? [String: String],
        let cls = NSClassFromString(Bundle.main.namespace + "." + clsName) as? WBBaseViewController.Type else {
                    return UIViewController()
                }
        
        let vc = cls.init()
        vc.title = title
        vc.vistorInfoDictionary = visitorDict
        
        vc.tabBarItem.image = UIImage.init(named: "tabbar_"+imgName)
        vc.tabBarItem.selectedImage = UIImage.init(named: "tabbar_"+imgName+"_selected")?.withRenderingMode(.alwaysOriginal)
        
        vc.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.orange], for: .highlighted)
        // 系统默认是 12 号字，修改字体大小，要设置 Normal 的字体大小
        vc.tabBarItem.setTitleTextAttributes(
            [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12)],
            for: UIControl.State(rawValue: 0))
        
        let nav = WBNavigationController.init(rootViewController: vc)
        
        return nav
    }
}


extension WBMainViewController {
    fileprivate func setupTimer(){
        let timer = Timer.scheduledTimer(timeInterval: 60.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc fileprivate func updateTimer() {
        if !WBNetworkManager.shared.userLogin {
            return
        }
        WBNetworkManager.shared.unreadCount { (count) in
            print("检测到\(count) 条新微博")
            
            self.tabBar.items?[0].badgeValue = count > 0 ? "\(count)" : nil
            // ios 8.0 badgeNumber 要用户授权之后才能够显示
            UIApplication.shared.applicationIconBadgeNumber = count
        }
    }
}


extension WBMainViewController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        let idx = (children as NSArray).index(of: viewController)
        
        if selectedIndex == 0 && idx == selectedIndex {
            print("点击首页")
            
            let nav = children.first as! UINavigationController
            let vc = nav.children.first as! WBHomeViewController
            
            vc.tableView?.setContentOffset(CGPoint.init(x: 0, y: -64), animated: true)
            
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
                vc.loadData()
            }
            
            vc.tabBarItem.badgeValue = nil
            UIApplication.shared.applicationIconBadgeNumber = 0
        }
        
        return !viewController.isMember(of: UIViewController.self)
    }
}


extension WBMainViewController {
    fileprivate func setupNewfeatureViews() {
        if !WBNetworkManager.shared.userLogin {
            return
        }
        /// TODO: 未完成
//        let v = isNewVersion ? WBTestViewController() : WBTestViewController()
//
//        view.addSubview(v)
    }
    
    
    private var isNewVersion: Bool {
        let currentVersion = Bundle.main.infoDictionary?["CFBoundleShortVersionString"] as? String ?? ""
        print("当前版本" + currentVersion)
        
        let path: String = ("version" as NSString).cz_appendDocumentDir()
        let sandboxVersion = (try? String(contentsOfFile: path)) ?? ""
        print("沙盒版本" + sandboxVersion)
        
        _ = try? currentVersion.write(toFile: path, atomically: true, encoding: .utf8)
        
        
        return currentVersion != sandboxVersion
    }
}
