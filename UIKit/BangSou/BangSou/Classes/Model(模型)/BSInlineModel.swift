//
//  BSInlineModel.swift
//  BangSou
//
//  Created by 何强 on 2019/12/9.
//  Copyright © 2019 何强. All rights reserved.
//

import UIKit

class BSInlineModel: NSObject {
   @objc var appUserId: String?
   @objc var avatarUrl: String?
   @objc var collect: String?
   @objc var createdTime: String?
   @objc var deleteFlag: String?
   @objc var detailCount: String?
   @objc var hot: String?
   @objc var id: String?
   @objc var imgUrl: String?
   @objc var keyword: String?
   @objc var lastTime: String?
   @objc var name: String?
   @objc var nickName: String?
   @objc var remark: String?
   @objc var run: String?
   @objc var scoreImgUrl: String?
   @objc var version: String?
   @objc var rankDetailList: [BSRankDetail]?
    
    
    override var description: String {
        return yy_modelDescription()
    }

}
