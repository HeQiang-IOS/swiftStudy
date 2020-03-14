//
//  ViewController.swift
//  7-UISegmentedControl
//
//  Created by 何强 on 2019/12/3.
//  Copyright © 2019 何强. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let seg: UISegmentedControl = UISegmentedControl.init(frame: .init(x: 10, y: 100, width: 300, height: 100))
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.view.addSubview(seg)
        
        seg.insertSegment(withTitle: "第一-----个按钮", at: 0, animated: true)
        seg.insertSegment(withTitle: "第二个按钮", at: 1, animated: true)
        
        seg.addTarget(self, action: #selector(clickSeg), for: .valueChanged)
//        seg.isMomentary = true
        
        seg.apportionsSegmentWidthsByContent = false
        
//        seg.setWidth(60, forSegmentAt: 0)
        
        seg.setContentOffset(CGSize.init(width: 10, height: 10), forSegmentAt: 1)
        seg.selectedSegmentIndex = 1
        
        seg.tintColor = .red
    }
    @objc func clickSeg(seg: UISegmentedControl) {
        print(seg.selectedSegmentIndex)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        seg.insertSegment(withTitle: "第三个按钮", at: 1, animated: true)
    }


}

