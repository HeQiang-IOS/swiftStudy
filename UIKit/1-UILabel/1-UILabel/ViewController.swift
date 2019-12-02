//
//  ViewController.swift
//  1-UILabel
//
//  Created by 何强 on 2019/12/2.
//  Copyright © 2019 何强. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let label:UILabel = UILabel.init(frame: CGRect.init(x: 20, y: 100, width: 280, height: 100))
        label.text = "I am a lable"
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.textColor = UIColor.red
        label.backgroundColor = UIColor.blue
        label.textAlignment = NSTextAlignment.center
        label.shadowColor = UIColor.orange
        label.shadowOffset = CGSize.init(width: 10, height: 10)
        label.numberOfLines = 0
        self.view.addSubview(label)
        
    }


}

