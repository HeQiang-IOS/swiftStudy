//
//  ViewController.swift
//  20-UIPickerView
//
//  Created by 何强 on 2019/12/3.
//  Copyright © 2019 何强. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
   
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 5
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return dataArray?[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return 100
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 40
    }
     
    
    
    var dataArray: Array<String>?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let pickerView: UIPickerView = UIPickerView.init(frame: .init(x: 100, y: 100, width: 300, height: 100))
        pickerView.delegate = self
        pickerView.dataSource = self
        dataArray = ["one", "two", "three", "four", "five"]
        self.view.addSubview(pickerView)
    }

    

}

