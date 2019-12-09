//
//  BSNavigationController.swift
//  BangSou
//
//  Created by 何强 on 2019/12/9.
//  Copyright © 2019 何强. All rights reserved.
//

import UIKit

class BSNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if children.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
        }
        
        if let vc = viewController as? BSBaseViewController {
            var title = "返回"
            if children.count == 1 {
                title = children.first?.title ?? "返回"
            }
            if children.count > 0 {
             vc.navigationItem.leftBarButtonItem = UIBarButtonItem.init(title:title, target: self, action: #selector(popToparent), isBack: true)
            }
        }
        
        super.pushViewController(viewController, animated: animated)
    }
    
    @objc private func popToparent() {
        popViewController(animated: true)
    }
}
