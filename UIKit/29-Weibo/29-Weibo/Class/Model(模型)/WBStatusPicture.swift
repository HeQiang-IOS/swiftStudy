//
//  WBStatusPicture.swift
//  Weibo
//
//  Created by 何强 on 2019/12/6.
//  Copyright © 2019 何强. All rights reserved.
//

import UIKit

class WBStatusPicture: NSObject {
    var thumbnail_pic: String? {
        didSet {
            largePic = thumbnail_pic?.replacingOccurrences(of: "/thumbnail/", with: "/large/")
            thumbnail_pic = thumbnail_pic?.replacingOccurrences(of: "/thumbnail/", with: "/wap360/")
        }
    }
    
    var largePic: String?
    
    override var description: String {
        return yy_modelDescription()
    }
}
