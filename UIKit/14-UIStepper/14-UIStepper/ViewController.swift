//
//  ViewController.swift
//  14-UIStepper
//
//  Created by 何强 on 2019/12/3.
//  Copyright © 2019 何强. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let label: UILabel = UILabel.init(frame: .init(x: 100, y: 300, width: 100, height: 100))
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let stepper: UIStepper = UIStepper.init(frame: .init(x: 100, y: 100, width: 100, height: 40))
        self.view.addSubview(stepper)
        self.view.addSubview(label)
        stepper.addTarget(self, action: #selector(change), for: .valueChanged)
        stepper.maximumValue = 10
        stepper.minimumValue = 0
        stepper.stepValue = 2
        stepper.isContinuous = false
        stepper.autorepeat = false
        stepper.wraps = true
        stepper.tintColor = .red
        label.text = String.init(format: "%f", stepper.value)
        
        
        
        
    }
    @objc func change(stepper: UIStepper) {
        label.text = String.init(format: "%f", stepper.value)
    }
}

