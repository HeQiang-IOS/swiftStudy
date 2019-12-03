//
//  ViewController.swift
//  8-UISegmentedControl
//
//  Created by 何强 on 2019/12/3.
//  Copyright © 2019 何强. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let viewBlue:UIView = UIView.init(frame: .init(x: 0, y: 0, width: 320, height: 568))
    let viewRed:UIView = UIView.init(frame: .init(x: 0, y: 0, width: 320, height: 568))

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let seg: UISegmentedControl = UISegmentedControl.init(items: ["blue", "red"])
        self.navigationItem.titleView = seg
        
        seg.addTarget(self, action: #selector(change), for: .valueChanged)
        self.view.addSubview(viewBlue)
        self.view.addSubview(viewRed)
        viewBlue.backgroundColor = .blue
        viewRed.backgroundColor = .red
        
        seg.selectedSegmentIndex = 1
    }

    @objc func change(seg:UISegmentedControl) {
        if seg.selectedSegmentIndex == 1 {
            self.view.bringSubviewToFront(viewRed)
        } else {
            self.view.bringSubviewToFront(viewBlue)
        }
    }

}

