//
//  ViewController.swift
//  9-UITextField
//
//  Created by 何强 on 2019/12/3.
//  Copyright © 2019 何强. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    let textField: UITextField = UITextField.init(frame: .init(x: 50, y: 100, width: 230, height: 44))
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.view.addSubview(textField)
        
        textField.borderStyle = .line
        textField.placeholder = "请输入文字"
        textField.textColor = .red
        textField.font = .systemFont(ofSize: 15)
        
        textField.textAlignment = .center
        textField.clearsOnBeginEditing = true
        textField.adjustsFontSizeToFitWidth = true
        textField.backgroundColor = .yellow
//        textField.isEnabled = false
        let viewLeft: UIView = UIView.init(frame: .init(x: 0, y: 0, width: 40, height: 40))
        let viewRight: UIView = UIView.init(frame: .init(x: 0, y: 0, width: 40, height: 40))
        
        viewLeft.backgroundColor = .blue
        viewRight.backgroundColor = .brown
        textField.leftView = viewLeft
//        textField.rightView = viewRight
        textField.leftViewMode = .always
//        textField.rightViewMode = .always
        textField.clearButtonMode = .always
        
        let board:UIView = UIView.init(frame: .init(x: 0, y: 0, width: 100, height: 40))
//        textField.inputView = board
        board.backgroundColor = .darkGray
//        textField.inputAccessoryView = board
        
        
        textField.delegate = self
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print(string)
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("begin")
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("End")
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        return false
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        textField.resignFirstResponder()
    }

}

