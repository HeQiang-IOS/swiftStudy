//
//  ViewController.swift
//  19-UITextView
//
//  Created by 何强 on 2019/12/3.
//  Copyright © 2019 何强. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let textView: UITextView = UITextView.init(frame: .init(x: 20, y: 100, width: 200, height: 100))
        textView.backgroundColor = .red
        self.view.addSubview(textView)
        
        textView.font = .systemFont(ofSize: 25)
        textView.textColor = .yellow
        textView.textAlignment = .center
        textView.isEditable = true
        
        textView.text = "hello  world! \n \n\nSwift:18680111111"
        textView.isSelectable = true
        textView.dataDetectorTypes = .phoneNumber
        
        textView.delegate = self
        
    }

    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        return true
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        
    }
    
    func textViewDidChange(_ textView: UITextView) {
    }
    
    func textViewDidChangeSelection(_ textView: UITextView) {
        
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        
    }
    
    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
        return true
    }
    
    func textViewShouldEndEditing(_ textView: UITextView) -> Bool {
        return true
    }
    
    
}

