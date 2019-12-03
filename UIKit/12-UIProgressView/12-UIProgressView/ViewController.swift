//
//  ViewController.swift
//  12-UIProgressView
//
//  Created by 何强 on 2019/12/3.
//  Copyright © 2019 何强. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let progress: UIProgressView = UIProgressView.init(progressViewStyle: .default)
        progress.frame = CGRect.init(x: 20, y: 100, width: 280, height: 20)
        self.view.addSubview(progress)
        progress.progress = 0.5
        progress.progressTintColor = .red
        progress.trackTintColor = .green
    }
    


}

