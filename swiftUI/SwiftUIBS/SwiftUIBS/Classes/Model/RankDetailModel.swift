//
//  RankDetailModel.swift
//  SwiftUIBS
//
//  Created by 何强 on 2019/12/18.
//  Copyright © 2019 何强. All rights reserved.
//

import SwiftUI
import YYModel

class RankDetailModel: NSObject, Identifiable {
   
    
    @objc var appUserId: String?
    @objc var createdTime: String?
    @objc var deleteFlag: String?
    @objc var id: String?
    @objc var lastTime: String?
    @objc var name: String?
    @objc var score: String?
    @objc var version: String?
    @objc var rankId: String?

    
    
    
    override class func description() -> String {
        return yy_modelDescription()
    }
}
