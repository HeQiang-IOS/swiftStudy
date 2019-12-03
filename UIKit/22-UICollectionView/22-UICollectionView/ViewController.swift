//
//  ViewController.swift
//  22-UICollectionView
//
//  Created by 何强 on 2019/12/3.
//  Copyright © 2019 何强. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegateFlowLayout,  UICollectionViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        
        layout.scrollDirection = UICollectionView.ScrollDirection.vertical
        layout.itemSize = CGSize.init(width: 80, height: 80)
        layout.minimumInteritemSpacing = 10 // 主轴
        layout.minimumLineSpacing = 30 // 侧轴
        
    
        let collectionView: UICollectionView = UICollectionView.init(frame: self.view.frame, collectionViewLayout: layout)
        
        collectionView.register(NSClassFromString("UICollectionViewCell"), forCellWithReuseIdentifier: "cellId")
        
        self.view.addSubview(collectionView)
        collectionView.dataSource = self
        collectionView.delegate = self
        
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
   
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath)
        cell.backgroundColor = .red
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let tmp = indexPath.row % 3
        if tmp == 0 {
            return CGSize.init(width: 50, height: 50)
        } else if tmp == 1 {
            return CGSize.init(width: 100, height: 100)
        } else {
            return CGSize.init(width: 50, height: 50)
        }
    }

}

