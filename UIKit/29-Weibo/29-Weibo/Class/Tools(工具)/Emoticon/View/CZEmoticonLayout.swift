//
//  CZEmoticonLayout.swift
//  007-表情键盘
//
//  Created by apple on 16/7/11.
//  Copyright © 2016年 itcast. All rights reserved.
//

import UIKit

/// 表情集合视图的布局
class CZEmoticonLayout: UICollectionViewFlowLayout {

    /// prepare 就是 OC 中的 prepareLayout
    override func prepare() {
        super.prepare()
        
        // 在此方法中，collectionView 的大小已经确定
        guard let collectionView = collectionView else {
            return
        }
        
        itemSize = collectionView.bounds.size
        
        // 设定滚动方向
        // 水平方向滚动，cell 垂直方向布局
        // 垂直方向滚动，cell 水平方向布局
        scrollDirection = .horizontal
    }
}
