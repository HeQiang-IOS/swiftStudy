//
//  BSNetworkManagerEx.swift
//  SwiftUIBS
//
//  Created by 何强 on 2019/12/18.
//  Copyright © 2019 何强. All rights reserved.
//

import SwiftUI

extension BSNetworkManager {
    func hotList(complection: @escaping(_ list:[[String: AnyObject]]?, _ isSuccess: Bool)->()) {
        let urlString = "https://bs.xiaobaideng.com:8080/rank/base/rank/hotList"
        
        requset(URLString: urlString, parameters: nil) { (json, isSuccess) in
            
            guard (json != nil) else {
                complection(nil, false)
                return
            }
            
            guard let dict = json as? [String: AnyObject] else {
                complection(nil, false)
                return
            }
            
            let resultCode = dict["resultCode"] as? Int
            if resultCode == 0 {
                let resultData = dict["data"] as? [[String: AnyObject]]
                complection(resultData, true)
            } else {
                complection(nil, false)
            }
        }
    }
    
    
    func rankDetail(id: String, complection: @escaping(_ json:[String: AnyObject]?, _ isSuccess: Bool)->()) {
        let urlString = "https://bs.xiaobaideng.com:8080/rank/base/rank/getRankDetail?id=" + id
        
        
        requset(URLString: urlString, parameters: nil) { (json, isSuccess) in
            
            guard (json != nil) else {
                complection(nil, false)
                return
            }
            
            guard let dict = json as? [String: AnyObject] else {
                complection(nil, false)
                return
            }
            
            let resultCode = dict["resultCode"] as? Int
            if resultCode == 0 {
                let resultData = dict["data"] as? [String: AnyObject]
                complection(resultData, true)
            } else {
                complection(nil, false)
            }
        }
    }
    
    
    
}
