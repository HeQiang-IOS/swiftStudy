//
//  ViewController.swift
//  10-UISider
//
//  Created by 何强 on 2019/12/3.
//  Copyright © 2019 何强. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
 let slider: UISlider = UISlider.init(frame: .init(x: 20, y: 100, width: 280, height: 40))
    
    let imageView: UIImageView = UIImageView.init(frame: .init(x: 0, y: 0, width: 320, height: 400))
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.view.addSubview(imageView)
        self.view.addSubview(slider)
        slider.maximumValue = 100
        slider.minimumValue = 1
        slider.isContinuous = false
        slider.minimumTrackTintColor = .red
        slider.maximumTrackTintColor = .yellow
        slider.thumbTintColor = .orange
        
        slider.addTarget(self, action: #selector(sliderValue), for: .valueChanged)
        
        imageView.image = UIImage.init(named: "lake0.jpg")
        
    }
    
    @objc func sliderValue(slider: UISlider) {
        print(slider.value)
        let value: Float = slider.value / 10
        imageView.bounds  = CGRect.init(x: 0, y: 0, width: imageView.frame.size.width*(CGFloat)(value), height: imageView.frame.size.height*(CGFloat)(value))
        
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        slider.setValue((Float)(arc4random()%100+1), animated: true)
    }

}

