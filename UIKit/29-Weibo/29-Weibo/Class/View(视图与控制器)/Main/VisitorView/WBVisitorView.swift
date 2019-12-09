//
//  WBVisitorView.swift
//  Weibo
//
//  Created by 何强 on 2019/12/6.
//  Copyright © 2019 何强. All rights reserved.
//

import UIKit

class WBVisitorView: UIView {
    lazy var registerButton: UIButton = UIButton.cz_textButton(
        "注册",
        fontSize: 16,
        normalColor: .orange,
        highlightedColor: .black,
        backgroundImageName: "common_button_white_disable")
    
    lazy var loginButton: UIButton = UIButton.cz_textButton(
        "登录",
        fontSize: 16,
        normalColor: .darkGray,
        highlightedColor: .black,
        backgroundImageName: "common_button_white_disable")
    
    lazy var tipLabel: UILabel = UILabel.cz_label(
        withText: "关注一些人，回这里看看有什么惊喜关注一些人， 回这里看看有什么惊喜",
        fontSize: 14,
        color: .darkGray)
    
    lazy var houseIconView: UIImageView = UIImageView.init(image: UIImage.init(named: "visitordiscover_feed_image_house"))
    
    lazy var maskIconView: UIImageView = UIImageView.init(image: UIImage.init(named: "visitordiscover_feed_mask_smallicon"))
    
    lazy var iconView: UIImageView = UIImageView.init(image: UIImage.init(named: "visitordiscover_feed_image_smallicon"))
    
    private func startAnimation() {
        let anim = CABasicAnimation.init(keyPath: "transform.rotation")
        anim.toValue = 2 * M_PI
        anim.repeatCount = MAXFLOAT
        anim.duration = 15
        
        anim.isRemovedOnCompletion = false
        
        iconView.layer.add(anim, forKey: nil)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var visitorInfo: [String: String]? {
        didSet {
            guard let imageName = visitorInfo?["imageName"],
                let message = visitorInfo?["message"] else {
                    return
            }
            
            tipLabel.text = message
            if imageName == "" {
                startAnimation()
                return
            }
            
            iconView.image = UIImage.init(named: imageName)
            houseIconView.isHidden = true
            maskIconView.isHidden = true
        }
    }
}


extension WBVisitorView {
    func setupUI() {
        backgroundColor = UIColor.cz_color(withHex: 0xEDEDED)
        
        addSubview(iconView)
        addSubview(maskIconView)
        addSubview(houseIconView)
        addSubview(tipLabel)
        addSubview(registerButton)
        addSubview(loginButton)
        
        tipLabel.textAlignment = .center
        
        for v in subviews {
            v.translatesAutoresizingMaskIntoConstraints = false
        }
        
        let margin: CGFloat = 20.0
        
        addConstraint(NSLayoutConstraint.init(item: iconView,
                                              attribute: .centerX,
                                              relatedBy: .equal,
                                              toItem: self,
                                              attribute: .centerX,
                                              multiplier: 1.0,
                                              constant: 0))
        
        addConstraint(NSLayoutConstraint.init(item: iconView,
                                              attribute: .centerY,
                                              relatedBy: .equal,
                                              toItem: self,
                                              attribute: .centerY,
                                              multiplier: 1.0,
                                              constant: -60))
        
        addConstraint(NSLayoutConstraint.init(item: houseIconView,
                                              attribute: .centerX,
                                              relatedBy: .equal,
                                              toItem: iconView,
                                              attribute: .centerX,
                                              multiplier: 1.0,
                                              constant: 0))
        addConstraint(NSLayoutConstraint.init(item: houseIconView,
                                              attribute: .centerY,
                                              relatedBy: .equal,
                                              toItem: iconView,
                                              attribute: .centerY,
                                              multiplier: 1.0,
                                              constant: 0))
        
        addConstraint(NSLayoutConstraint.init(item: tipLabel,
                                              attribute: .centerX,
                                              relatedBy: .equal,
                                              toItem: iconView,
                                              attribute: .centerX,
                                              multiplier: 1.0,
                                              constant: 0))
        addConstraint(NSLayoutConstraint.init(item: tipLabel,
                                              attribute: .top,
                                              relatedBy: .equal,
                                              toItem: iconView,
                                              attribute: .bottom,
                                              multiplier: 1.0,
                                              constant: margin))
        addConstraint(NSLayoutConstraint.init(item: tipLabel,
                                              attribute: .width,
                                              relatedBy: .equal,
                                              toItem: nil,
                                              attribute: .notAnAttribute,
                                              multiplier: 1.0,
                                              constant: 236))
        
        addConstraint(NSLayoutConstraint.init(item: registerButton,
                                              attribute: .left,
                                              relatedBy: .equal,
                                              toItem: tipLabel,
                                              attribute: .left,
                                              multiplier: 1.0,
                                              constant: 0))
        addConstraint(NSLayoutConstraint.init(item: registerButton,
                                              attribute: .top,
                                              relatedBy: .equal,
                                              toItem: tipLabel,
                                              attribute: .bottom,
                                              multiplier: 1.0,
                                              constant: margin))
        
        addConstraint(NSLayoutConstraint.init(item: registerButton,
                                              attribute: .width,
                                              relatedBy: .equal,
                                              toItem: nil,
                                              attribute: .notAnAttribute,
                                              multiplier: 1.0,
                                              constant: 100))
        
        
        addConstraint(NSLayoutConstraint.init(item: loginButton,
                                              attribute: .right,
                                              relatedBy: .equal,
                                              toItem: tipLabel,
                                              attribute: .right,
                                              multiplier: 1.0,
                                              constant: 0))
        
        addConstraint(NSLayoutConstraint.init(item: loginButton,
                                              attribute: .top,
                                              relatedBy: .equal,
                                              toItem: tipLabel,
                                              attribute: .bottom,
                                              multiplier: 1.0,
                                              constant: margin))
        
        addConstraint(NSLayoutConstraint.init(item: loginButton,
                                              attribute: .width,
                                              relatedBy: .equal,
                                              toItem: registerButton,
                                              attribute: .width,
                                              multiplier: 1.0,
                                              constant: 0))
        
        
        let viewDict = ["maskIconView": maskIconView,
        "registerButton": registerButton] as [String: Any]
        let metrics = ["spacing": 20]
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[maskIconView]-0-|", options: [], metrics: nil, views: viewDict))
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[maskIconView]-(spacing)-[registerButton]", options: [], metrics: metrics, views: viewDict))
        
        
        
    }
}
