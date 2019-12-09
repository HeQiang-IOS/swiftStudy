//
//  WBStatusListDAL.swift
//  Weibo
//   DAL - Data Access Layer 数据访问层
//  使命：负责处理数据库和网络数据，给ListViewModel， 在调整系统的时候，尽量做最小化的调整
//  Created by 何强 on 2019/12/9.
//  Copyright © 2019 何强. All rights reserved.
//

import Foundation

class WBStatusListDAL {
    class func loadStatus(since_id: Int64 = 0, max_id: Int64 = 0, completion: @escaping (_ list: [[String: AnyObject]]?, _ isSuccess: Bool)->()){
        guard let userId = WBNetworkManager.shared.userAccount.uid else {
            return
        }
        
        let array = CZSQLiteManager.shared.loadStatus(userId: userId, since_id: since_id, max_id: max_id)
        
        if array.count > 0 {
            completion(array, true)
            return
        }
        
        WBNetworkManager.shared.statusList(since_id: since_id, max_id: max_id) { (list, isSuccess) in
            if !isSuccess {
                completion(nil, false)
                return
            }
            
            guard let list = list else {
                completion(nil, isSuccess)
                return
            }
            
            CZSQLiteManager.shared.updateStatus(userId: userId, array: list)
            
            completion(list, isSuccess)
        }
    }
}
