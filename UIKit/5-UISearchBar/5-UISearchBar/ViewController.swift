//
//  ViewController.swift
//  5-UISearchBar
//
//  Created by 何强 on 2019/12/2.
//  Copyright © 2019 何强. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UISearchBarDelegate {
    let searchBar:UISearchBar = UISearchBar.init(frame: .init(x: 20, y: 100, width: 280, height: 50))
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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
        searchBar.delegate = self
        self.view.addSubview(searchBar)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        searchBar.resignFirstResponder()
    }
    
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        print(selectedScope)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        print("cancel")
    }
    func searchBarResultsListButtonClicked(_ searchBar: UISearchBar) {
        print("resultsList")
    }
    
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        return true
    }
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        
    }
    
    func searchBar(_ searchBar: UISearchBar, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        print(text)
        return true
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
         
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        
    }

}

