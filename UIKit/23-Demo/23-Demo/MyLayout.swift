//
//  MyLayout.swift
//  23-Demo
//
//  Created by 何强 on 2019/12/3.
//  Copyright © 2019 何强. All rights reserved.
//

import UIKit

class MyLayout: UICollectionViewFlowLayout {
    var itemCount: Int?
    var attributeArray: Array<UICollectionViewLayoutAttributes>?
    
    override func prepare() {
        super.prepare()
        let width = (UIScreen.main.bounds.size.width - self.minimumInteritemSpacing) / 2
        var l = 0
        var r = 0
        for 
    }
}
