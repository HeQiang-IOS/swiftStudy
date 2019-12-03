//
//  ViewController.swift
//  16-UIActionSheet
//
//  Created by 何强 on 2019/12/3.
//  Copyright © 2019 何强. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        /*
        let actionSheet: UIActionSheet  = UIActionSheet.init(title: "actionSheet", delegate: self, cancelButtonTitle: "cancel", destructiveButtonTitle: "delete", otherButtonTitles: "one", "two")
        actionSheet.show(in: self.view)
        
        func actionSheet(_ actionSheet: UIActionSheet, clickedButtonAt buttonIndex: Int) {
               print(buttonIndex)
           }
         , UIActionSheetDelegate
 */
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let actionSheet: UIAlertController = UIAlertController.init(title: "actionSheet", message: "look me", preferredStyle: .actionSheet)
        let actionAction: UIAlertAction = UIAlertAction.init(title: "one", style: .default) { (action) in
            print("one")
        }
        
        let actionActionOne: UIAlertAction = UIAlertAction.init(title: "two", style: .default) { (action) in
            print("two")
        }
        
        actionSheet.addAction(actionAction)
        actionSheet.addAction(actionActionOne)
        
        self.present(actionSheet, animated: true, completion: nil)
    }
    
   


}

