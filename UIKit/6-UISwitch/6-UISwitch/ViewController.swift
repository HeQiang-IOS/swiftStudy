//
//  ViewController.swift
//  6-UISwitch
//
//  Created by 何强 on 2019/12/3.
//  Copyright © 2019 何强. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let mySwitch: UISwitch = UISwitch.init(frame: .init(x: 100, y: 100, width: 100, height: 100))
        
        self.view.addSubview(mySwitch)
        mySwitch.thumbTintColor = UIColor.red
        mySwitch.onTintColor = UIColor.yellow
        mySwitch.tintColor = UIColor.blue
        mySwitch.addTarget(self, action: #selector(switchClick), for: .valueChanged)
    }
    @objc func switchClick(swi: UISwitch) {
        if swi.isOn {
            self.view.backgroundColor = .black
        } else {
            self.view.backgroundColor = .white
        }
    }
}

