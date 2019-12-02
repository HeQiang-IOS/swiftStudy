//
//  ViewController.swift
//  4-UIImageView
//
//  Created by 何强 on 2019/12/2.
//  Copyright © 2019 何强. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let imageView = UIImageView.init(frame: .init(x: 100, y: 100, width: 100, height: 100))
        imageView.backgroundColor = UIColor.red
        self.view.addSubview(imageView)
        
//        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 50
        imageView.layer.borderWidth = 2
        imageView.layer.borderColor = UIColor.green.cgColor
        imageView.layer.shadowColor = UIColor.purple.cgColor
        imageView.layer.shadowOffset = CGSize.init(width: 10, height: 10)
        imageView.layer.shadowOpacity = 1
        
    }


}

