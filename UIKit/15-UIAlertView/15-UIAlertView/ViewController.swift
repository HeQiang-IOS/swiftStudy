//
//  ViewController.swift
//  15-UIAlertView
//
//  Created by 何强 on 2019/12/3.
//  Copyright © 2019 何强. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
       /* let alertView: UIAlertView = UIAlertView.init(title: "标题", message: "122", delegate: self, cancelButtonTitle: "cancel")
        alertView.alertViewStyle  = .loginAndPasswordInput
        UIAlertViewDelegate
        alertView.show()
         func alertView(_ alertView: UIAlertView, clickedButtonAt buttonIndex: Int) {
               print(buttonIndex)
           }
 */
        
        
    }
    
  
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let alertView: UIAlertController = UIAlertController.init(title: "alert", message: "look me", preferredStyle: .alert)
        let alertActionOne: UIAlertAction = UIAlertAction.init(title: "cancel", style: .destructive) { (alert) in
            print("cancel")
        }
        let alertActionTwo: UIAlertAction = UIAlertAction.init(title: "OK", style: .default) { (alert) in
            print("OK")
            print(alertView.textFields?.first?.text ?? "")
        }
        alertView.addTextField { (textField) in
            textField.placeholder = "hello world"
        }
        
        alertView.addAction(alertActionOne)
        alertView.addAction(alertActionTwo)
        self.present(alertView, animated: true, completion: nil)
    }

}

