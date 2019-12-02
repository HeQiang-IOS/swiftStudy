//
//  ViewController.swift
//  3--UIImageView
//
//  Created by 何强 on 2019/12/2.
//  Copyright © 2019 何强. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let imageView: UIImageView = UIImageView.init(frame: .init(x: 100, y: 100, width: 100, height: 100))
               imageView.image = UIImage.init(named: "lake.jpg")
               imageView.backgroundColor = UIColor.gray
               imageView.highlightedImage = UIImage.init(named: "lake1.jpg")
               
               self.view.addSubview(imageView)
               
               var array:Array<UIImage> = Array()
               for index in 0...2 {
                   let image:UIImage? = UIImage.init(named: String.init(format: "lake%d.jpg", index))
                   array.append(image!)
               }
               
               imageView.animationImages = array
               imageView.animationDuration = 2
               imageView.animationRepeatCount = 0
               imageView.startAnimating()
    }


}

