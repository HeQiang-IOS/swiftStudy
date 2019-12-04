//
//  ViewController.swift
//  23-Demo
//
//  Created by 何强 on 2019/12/3.
//  Copyright © 2019 何强. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath)
        cell.backgroundColor = UIColor.init(red: (CGFloat)(arc4random()%255) / 255, green: (CGFloat)(arc4random()%255) / 255, blue: (CGFloat)(arc4random()%255) / 255, alpha: 1)
        print(((CGFloat)(arc4random()%255) / 255))
//        cell.backgroundColor = .red
        return cell
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let myLayout = MyLayout()
        myLayout.itemCount = 100
        
        let collectView = UICollectionView.init(frame: self.view.frame, collectionViewLayout: myLayout)
        collectView.delegate = self
        collectView.dataSource = self
        
        collectView.register(NSClassFromString("UICollectionViewCell"), forCellWithReuseIdentifier: "cellId")
        self.view.addSubview(collectView)
    }


}

