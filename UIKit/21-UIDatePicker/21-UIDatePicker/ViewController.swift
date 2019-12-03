//
//  ViewController.swift
//  21-UIDatePicker
//
//  Created by 何强 on 2019/12/3.
//  Copyright © 2019 何强. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let datePicke: UIDatePicker = UIDatePicker.init(frame: .init(x: 20, y: 100, width: 300, height: 300))
        datePicke.datePickerMode = .date
        self.view.addSubview(datePicke)
        
        datePicke.addTarget(self, action: #selector(changeDate), for: .valueChanged)
    }

    @objc func changeDate(datePicker: UIDatePicker) {
        let date = datePicker.date
        print(date)
    }

}

