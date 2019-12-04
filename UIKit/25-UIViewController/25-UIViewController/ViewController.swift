//
//  ViewController.swift
//  25-UIViewController
//
//  Created by 何强 on 2019/12/4.
//  Copyright © 2019 何强. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var tmp: Int = 0
    override func loadView() {
        super.loadView()
        tmp += 1
        print(tmp, "loadView")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tmp += 1
        print(tmp, "willAppear")
    }
    // 布局
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        tmp += 1
        print(tmp, "willLayoutSubviews")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tmp += 1
        print(tmp, "didLayoutSubviews")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tmp += 1
        print(tmp, "didAppear")
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        tmp += 1
        print(tmp, "willDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        tmp += 1
        print(tmp, "didDisappear")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tmp += 1
        print(tmp, "didLoad")
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.dismiss(animated: true, completion: nil)
    }
}

