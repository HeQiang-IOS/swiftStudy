//
//  BSMainViewController.swift
//  BangSou
//
//  Created by 何强 on 2019/12/9.
//  Copyright © 2019 何强. All rights reserved.
//

import UIKit

class BSMainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupChildControllers()
    }
}


extension BSMainViewController {
    
    private func setupChildControllers() {
        let array = [
            ["clsName": "BSHomeViewController", "title": "首页", "imageName":"home"],
            ["clsName": "BSProfileViewController", "title": "我的", "imageName":"profile"],
        ];
        
        
        var arrayM = [UIViewController]()
        
        for dict in array {
            arrayM.append(controller(dict: dict))
        }
        
        viewControllers = arrayM
    }
    
    private func controller(dict:[String: String]) -> UIViewController {
        guard let clsName = dict["clsName"] ,
        let title = dict["title"],
        let imageName = dict["imageName"],
        let cls = NSClassFromString(Bundle.main.namespace + "." + clsName) as? BSBaseViewController.Type
        else {
            return UIViewController()
        }
        
        
        let vc = cls.init()
        vc.title = title
        vc.tabBarItem.image = UIImage.init(named: "tabbar_"+imageName)
        vc.tabBarItem.selectedImage = UIImage.init(named: "tabbar_"+imageName+"_selected")?.withRenderingMode(.alwaysOriginal)
        
        vc.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.orange], for: .highlighted)
        
        vc.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12)], for: UIControl.State(rawValue: 0))
        
        let nav = BSNavigationController.init(rootViewController: vc)
        
        return nav
    }
}
