//
//  WBMainViewController.swift
//  29-Weibo
//
//  Created by 何强 on 2019/12/5.
//  Copyright © 2019 何强. All rights reserved.
//

import UIKit

class WBMainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupChildControllers()
        setupComposeButton()
        // Do any additional setup after loading the view.
    }
    
    private lazy var composeButton: UIButton = UIButton.cz_imageButton("tabbar_compose_icon_add", backgroundImageName: "tabbar_compose_button")
    
    @objc private func composeStatus(){
        print("编写博客")
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
        let array = [
            ["clsName": "WBHomeViewController", "title": "首页", "imgName": "home"],
            ["clsName": "WBMessageViewController", "title": "消息", "imgName": "message_center"],
            ["clsName":"UIViewController"],
            ["clsName": "WBDiscoverViewController", "title": "发现", "imgName": "discover"],
            ["clsName": "WBProfileViewController", "title": "我", "imgName": "profile"]
        ]
        
        var arrayM = [UIViewController]()
        
        for dict in array {
            arrayM.append(controller(dict: dict))
        }
        viewControllers = arrayM
    }
    
    private func controller(dict: [String: String]) -> UIViewController {
        print(Bundle.main.namespace)
        
       guard let clsName = dict["clsName"],
        let title = dict["title"],
        let imgName = dict["imgName"],
        let cls = NSClassFromString(Bundle.main.namespace + "." + clsName) as? UIViewController.Type else {
                    return UIViewController()
                }
        
        let vc = cls.init()
        vc.title = title
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
