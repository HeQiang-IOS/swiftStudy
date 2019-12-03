//
//  ViewController.swift
//  11-UIActivityIndicatorView
//
//  Created by 何强 on 2019/12/3.
//  Copyright © 2019 何强. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
//    let activity: UIActivityIndicatorView = UIActivityIndicatorView.init(frame: CGRect.init(x: 100, y: 100, width: 100, height: 100))
    let activity: UIActivityIndicatorView = UIActivityIndicatorView.init(style: .large)
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        activity.backgroundColor = .red
        activity.color = .yellow
        activity.center = self.view.center
        self.view.addSubview(activity)
        
        activity.startAnimating()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        activity.stopAnimating()
    }


}

