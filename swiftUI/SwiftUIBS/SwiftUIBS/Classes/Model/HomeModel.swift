//
//  HomeModel.swift
//  SwiftUIBS
//
//  Created by 何强 on 2019/12/18.
//  Copyright © 2019 何强. All rights reserved.
//

import SwiftUI
import YYModel

class HomeModel: NSObject, Identifiable {
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
    @objc var rankDetailList: [RankDetailModel]?
    
    override class func description() -> String {
        return yy_modelDescription()
    }
    
    /// 类函数 -> 告诉第三方框架 YY_Model 如果遇到数组类型的属性，数组中存放的对象是什么类？
    /// NSArray 中保存对象的类型通常是 `id` 类型
    /// OC 中的泛型是 Swift 推出后，苹果为了兼容给 OC 增加的
    /// 从运行时角度，仍然不知道数组中应该存放什么类型的对象
   @objc class func modelContainerPropertyGenericClass() -> [String: AnyClass] {
        return ["rankDetailList": RankDetailModel.self]
    }
}


