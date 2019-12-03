//
//  ViewController.swift
//  13-UIPageControl
//
//  Created by 何强 on 2019/12/3.
//  Copyright © 2019 何强. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let page: UIPageControl = UIPageControl.init(frame: .init(x: 100, y: 100, width: 100, height: 100))
        self.view.backgroundColor = .red
        self.view.addSubview(page)
        
        page.numberOfPages = 6
        page.currentPage = 3
        page.hidesForSinglePage = true
        page.currentPageIndicatorTintColor = .blue
        page.pageIndicatorTintColor = .purple
        
        page.addTarget(self, action: #selector(change), for: .valueChanged)
        
    }

    @objc func change(page: UIPageControl) {
        print(page.currentPage)
    }
    

}

