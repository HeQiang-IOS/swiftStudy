//
//  BSRankDetail.swift
//  BangSou
//
//  Created by 何强 on 2019/12/9.
//  Copyright © 2019 何强. All rights reserved.
//

import UIKit

class BSRankDetail: NSObject {
    
   @objc var appUserId: String?
   @objc var createdTime: String?
   @objc var deleteFlag: String?
   @objc var id: String?
   @objc var lastTime: String?
   @objc var name: String?
   @objc var score: String?
   @objc var version: String?
    
    override var description: String {
        return yy_modelDescription()
    }
    
}
