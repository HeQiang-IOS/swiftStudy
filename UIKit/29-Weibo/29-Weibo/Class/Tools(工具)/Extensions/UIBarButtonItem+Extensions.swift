//
//  UIBarButtonItem+Extensions.swift
//  Weibo
//
//  Created by 何强 on 2019/12/5.
//  Copyright © 2019 何强. All rights reserved.
//

import Foundation

extension UIBarButtonItem {
    convenience init(title: String, fontSize: CGFloat=16, target: AnyObject?, action: Selector, isBack: Bool = false) {
         let btn:UIButton = UIButton.cz_textButton(title, fontSize: fontSize, normalColor: UIColor.darkGray, highlightedColor: UIColor.orange)
        
        if isBack {
            let imageName = "navigationbar_back_withtext"
            btn.setImage(UIImage.init(named: imageName), for: UIControl.State.init(rawValue: 0))
            btn.setImage(UIImage.init(named: imageName + "_highlighted"), for: .highlighted)
        }
        
        btn.addTarget(target, action: action, for: .touchUpInside)
        self.init(customView: btn)
    }
}
