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
        
        attributeArray = Array()
        let width = (UIScreen.main.bounds.size.width - self.minimumInteritemSpacing) / 2
        var l = 0
        var r = 0
        for index in 0..<itemCount! {
            let indexPath = NSIndexPath.init(item: index, section: 0)
            let attri = UICollectionViewLayoutAttributes.init(forCellWith: indexPath as IndexPath)
            let height = arc4random()%140 + 50
            print(height)
            var tmp = 0
            var H = 0
            
            if l<=r {
                H = l + (Int)(self.minimumLineSpacing)
                l = l + (Int)(height) + (Int)(self.minimumLineSpacing)
                tmp = 0
              
            } else {
                H = r + (Int)(self.minimumLineSpacing)
                r = r + (Int)(height) + (Int)(self.minimumLineSpacing)
                tmp = 1
                
            }
            print(tmp)
            
            attri.frame = CGRect.init(x: (CGFloat)(tmp)*(width + self.minimumInteritemSpacing), y: (CGFloat)(H), width: width, height: (CGFloat)(height))
            attributeArray?.append(attri)
        }
        
        if l<=r {
            self.itemSize = CGSize.init(width: width, height: (CGFloat)(r * 2 / itemCount!) - self.minimumLineSpacing)
        } else {
            self.itemSize = CGSize.init(width: width, height: (CGFloat)(l * 2 / itemCount!) - self.minimumLineSpacing)
        }
    }
    
    
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        return attributeArray!
    }
}
