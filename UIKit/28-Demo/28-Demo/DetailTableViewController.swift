//
//  DetailTableViewController.swift
//  28-Demo
//
//  Created by 何强 on 2019/12/4.
//  Copyright © 2019 何强. All rights reserved.
//

import UIKit

class DetailTableViewController: UITableViewController {
    
    
    @IBOutlet weak var namText: UITextField!
    @IBOutlet weak var phoneText: UITextField!
    @IBOutlet weak var titleText: UITextField!
    
    var completCallBack: (()->())?
    
    var person: Person?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if person != nil {
            namText.text = person?.name
            phoneText.text = person?.phone
            titleText.text = person?.title
        }

    }

    @IBAction func savePerson(_ sender: Any) {
        person?.name = namText.text
        person?.phone = phoneText.text
        person?.title = titleText.text
        
        completCallBack?()
        
        _ = navigationController?.popViewController(animated: true)
    }
    
}
