//
//  HomeListViewModelDAL.swift
//  SwiftUIBS
//
//  Created by 何强 on 2019/12/18.
//  Copyright © 2019 何强. All rights reserved.
//

import SwiftUI

class HomeListViewModelDAL {
    class func loadHotList(completion: @escaping (_ list: [[String: AnyObject]]?, _ isSuccess: Bool)->()){
        
        BSNetworkManager.shared.hotList { (list, isSuccess) in
            if !isSuccess {
                completion(nil, false)
                return
            }
            
            guard let list = list else  {
                completion(nil, isSuccess)
                return
            }
            
            completion(list, isSuccess)
        }
    }
    
    
    class func loadRankDetal(id: String, completion: @escaping (_ json: [String: AnyObject]?, _ isSuccess: Bool)->()){
        
        BSNetworkManager.shared.rankDetail(id: id) { (json, isSuccess) in
            
            if !isSuccess {
                completion(nil, false)
                return
            }
            
            guard let json = json else  {
                completion(nil, isSuccess)
                return
            }
            
            completion(json, isSuccess)
        }
    }
}
