//
//  ViewController.swift
//  5-UISearchBar
//
//  Created by 何强 on 2019/12/2.
//  Copyright © 2019 何强. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let searchBar: UISearchBar = UISearchBar.init(frame: .init(x: 20, y: 100, width: 280, height: 50))
        searchBar.placeholder = "请输入关键字"
        searchBar.text = "key"
        searchBar.barStyle = .default
        searchBar.prompt = "背景"
        searchBar.showsCancelButton = true
        // 设置渲染颜色
        searchBar.tintColor = UIColor.red
        searchBar.barTintColor = UIColor.yellow
        searchBar.scopeButtonTitles = ["1", "2", "3", "4"]
        searchBar.showsScopeBar = true // ios8 改变了
        
        self.view.addSubview(searchBar)
    }


}

