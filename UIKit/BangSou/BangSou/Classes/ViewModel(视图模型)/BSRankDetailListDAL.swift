//
//  BSRankDetailList.swift
//  BangSou
//
//  Created by 何强 on 2019/12/9.
//  Copyright © 2019 何强. All rights reserved.
//

import Foundation

class BSRankDetailListDAL {
    
    class func loadHotList(completion: @escaping (_ list:[[String: AnyObject]]?, _ isSuccess: Bool)->()) {
        
        BSNetworkManager.shared.hotList { (list, isSuccess) in
            print(list)
            print(isSuccess)
            if !isSuccess {
                completion(nil, false)
                return
            }
            
            guard let list = list else {
                completion(nil, isSuccess)
                return
            }
            
            completion(list, isSuccess)
        }
    }
}
