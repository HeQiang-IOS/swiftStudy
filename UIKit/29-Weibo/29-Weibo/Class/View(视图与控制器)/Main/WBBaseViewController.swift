//
//  WBBaseViewController.swift
//  29-Weibo
//
//  Created by 何强 on 2019/12/5.
//  Copyright © 2019 何强. All rights reserved.
//

import UIKit

class WBBaseViewController: UIViewController {
    
    lazy var navigationBar = NavigationBar.init(frame: .init(x: 0, y: 0, width: UIScreen.cz_screenWidth(), height: 64))
    
    lazy var navItem = UINavigationItem.init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setupUI()
    }
    
    override var title: String? {
        didSet {
            navItem.title = title
        }
    }
    
    
}

extension WBBaseViewController {
    @objc func setupUI() {
        view.backgroundColor = UIColor.cz_random()
        navigationBar.barTintColor = UIColor.cz_color(withHex: 0xF6F6F6)
//        navigationBar.isTranslucent = true
//        navigationBar.setBackgroundImage(nil, for: .default)
        view.addSubview(navigationBar)
       
       
        
         navigationBar.items = [navItem]
        navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.darkGray]
        
        
    }
}

class NavigationBar: UINavigationBar {
    private var is_iPhone_X: Bool {
        return UIScreen.main.bounds.size.height >= 812 ? true : false
    }
    override func layoutSubviews() {
        super .layoutSubviews()
        
//        let systemVersion:Double = UIDevice.current.systemVersion
//        if systemVersion < 11.0 {
//            return
//        }
        if #available(iOS 11, *) {
            
        } else {
            return
        }
        
        for view in subviews {
                var frame = view.frame
                
                if NSStringFromClass(type(of: view)).lowercased().contains("background".lowercased()) {
                    frame.size.height = 64
                    if is_iPhone_X { frame.origin.y = 24 }
                }
                
                if NSStringFromClass(type(of: view)).lowercased().contains("contentView".lowercased()) {
                    frame.origin.y = 20
                    if is_iPhone_X { frame.origin.y = 44 }
                    
                    if #available(iOS 13, *) {
                        let margins: UIEdgeInsets = view.layoutMargins
                        view.frame = CGRect.init(x: -margins.left, y: -margins.top, width: margins.left + margins.right + view.frame.size.width, height: margins.top + margins.bottom + view.frame.size.height)
                    } else {
//                        view.layoutMargins = UIEdgeInsets.init(top: 0, left: 2, bottom: 0, right: 2)
                        view.layoutMargins = UIEdgeInsets.zero
                    }
                }
                view.frame = frame
            }
    }
}

