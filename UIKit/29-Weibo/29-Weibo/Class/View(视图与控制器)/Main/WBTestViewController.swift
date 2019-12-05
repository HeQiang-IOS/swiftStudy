//
//  WBTestViewController.swift
//  Weibo
//
//  Created by 何强 on 2019/12/5.
//  Copyright © 2019 何强. All rights reserved.
//

import UIKit

class WBTestViewController: WBBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "第 \(navigationController?.children.count ?? 0 ) 个"
        // Do any additional setup after loading the view.
    }
    
    @objc private func showNext() {
        let vc = WBTestViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension WBTestViewController {
    override func setupUI() {
        super.setupUI()
//        navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "下一个", style: .plain, target: self, action: #selector(showNext))
        navItem.rightBarButtonItem = UIBarButtonItem.init(title: "下一个", target: self, action: #selector(showNext))
    }
}
