//
//  WBNavigationController.swift
//  29-Weibo
//
//  Created by 何强 on 2019/12/5.
//  Copyright © 2019 何强. All rights reserved.
//

import UIKit

class WBNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBar.isHidden = true
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        print(children.count)
        if children.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
        }
        
        if let vc = viewController as? WBBaseViewController {
            
            var title = "返回"
            if children.count == 1 {
                title = children.first?.title ?? "返回"
            }
            
            vc.navItem.leftBarButtonItem = UIBarButtonItem.init(title:title, target: self, action: #selector(popToparent), isBack: true)
        }
        super.pushViewController(viewController, animated: animated)
    }
    
    @objc private func popToparent() {
        popViewController(animated: true)
    }
}
