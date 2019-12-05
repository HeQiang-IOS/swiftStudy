//
//  WBHomeViewController.swift
//  29-Weibo
//
//  Created by 何强 on 2019/12/5.
//  Copyright © 2019 何强. All rights reserved.
//

import UIKit

class WBHomeViewController: WBBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @objc private func showFriends () {
        print("friends")
        let vc = WBTestViewController()
        vc.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(vc, animated: true)
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
