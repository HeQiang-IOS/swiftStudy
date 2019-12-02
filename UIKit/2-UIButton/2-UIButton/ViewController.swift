//
//  ViewController.swift
//  2-UIButton
//
//  Created by 何强 on 2019/12/2.
//  Copyright © 2019 何强. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let button: UIButton = UIButton.init(type: UIButton.ButtonType.custom)
        
        button.frame = CGRect.init(x: 100, y: 100, width: 100, height: 100)
        button.backgroundColor = UIColor.red
        self.view .addSubview(button)
        button.addTarget(self, action: #selector(click), for: UIControl.Event.touchUpInside)
        button.setTitle("按钮", for: .normal)
        button.contentEdgeInsets = UIEdgeInsets.init(top: -10, left: -10, bottom: 0, right: 0)
//        button.setBackgroundImage(UIImage.init(named: "lake.jpg"), for: .normal)
        button.setImage(UIImage.init(named: "lake.jpg"), for: .normal)
        button.showsTouchWhenHighlighted = true
        
    }

    @objc func click(btn: UIButton) {
        print("按钮被点击了")
        btn.backgroundColor = UIColor.init(red: (CGFloat)(arc4random()%255)/255, green: (CGFloat)(arc4random()%250)/255, blue: (CGFloat)(arc4random()%215)/255, alpha: 1.0)
    }
}

