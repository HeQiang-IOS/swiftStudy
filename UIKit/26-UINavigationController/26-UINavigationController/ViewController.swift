//
//  ViewController.swift
//  26-UINavigationController
//
//  Created by 何强 on 2019/12/4.
//  Copyright © 2019 何强. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = .purple
        self.title = "标题"
        let label: UILabel = UILabel.init(frame: .init(x: 100, y: 100, width: 100, height: 30))
        label.backgroundColor = .red
        label.text = "Hello world"
        self.view.addSubview(label)
        
        let button: UIButton = UIButton.init(frame: .init(x: 100, y: 200, width: 100, height: 30))
        button.backgroundColor = .red
        button.setTitle("切换", for: .normal)
        button.addTarget(self, action: #selector(changeController), for: .touchUpInside)
        self.view.addSubview(button)
        
        self.navigationController?.navigationBar.tintColor = .green
        self.navigationController?.navigationBar.barTintColor = .orange
        
        let barButtonItem: UIBarButtonItem = UIBarButtonItem.init(title: "返回", style: .plain, target: self, action: #selector(back))
        self.navigationItem.backBarButtonItem = barButtonItem
//        self.navigationItem.leftBarButtonItem = barButtonItem
//        self.navigationItem.rightBarButtonItem = barButtonItem
        let barL1: UIBarButtonItem  = UIBarButtonItem.init(title: "1", style: .plain, target: self, action: #selector(back))
        
        self.navigationItem.leftBarButtonItem = barL1
        
        let barR1: UIBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: .bookmarks, target: self, action: #selector(action1))
        let barR2: UIBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: .bookmarks, target: self, action: #selector(action2))
        
//        self.navigationItem.rightBarButtonItems = [barR1, barR2]
        
        self.navigationController?.isToolbarHidden = false
        self.toolbarItems = [barR1, barR2]
        
        
    }
    
    @objc func action1() {
        print("action1")
    }
    
    @objc func action2(){
        print("action2")
    }
    
    @objc func back() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func changeController(btu: UIButton) {
        let viewController: ViewController = ViewController.init()
        self.navigationController?.pushViewController(viewController, animated: true)
    }


}

