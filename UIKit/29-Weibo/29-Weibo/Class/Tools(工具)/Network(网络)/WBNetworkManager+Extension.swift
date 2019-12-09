//
//  WBNetworkManager+Extension.swift
//  Weibo
//
//  Created by 何强 on 2019/12/6.
//  Copyright © 2019 何强. All rights reserved.
//

import Foundation

extension WBNetworkManager {
    
    func statusList(since_id: Int64 = 0, max_id: Int64 = 0, completion: @escaping (_ list:[[String: AnyObject]]?, _ isSuccess: Bool)->()) {
        let urlString = "https://"
        
        let params = ["since_id": "\(since_id)",
            "max_id": "\(max_id > 0 ? max_id - 1 : 0)"]
        tokenRequest(URLString: urlString, parameters: params as [String: AnyObject]?) { (json, isSuccess) in
            
            guard (json != nil) else {
                return
            }
            let result = (json as! NSDictionary)["statuses"] as? [[String: AnyObject]]
            
            completion(result, isSuccess)
        }
    }
    
    func unreadCount(completion: @escaping (_ count: Int)->()) {
        
        guard let uid = userAccount.uid else {
            return
        }
        
        let urlString = "https:"
        
        let params = ["uid": uid]
        
        tokenRequest(URLString: urlString, parameters: params as [String: AnyObject]?) { (json, isSuccess) in
            let dict = json as? [String: AnyObject]
            let count = dict?["status"] as? Int
            
            completion(count ?? 0)
        }
    }
    
    
}

extension WBNetworkManager {
    func postStatus(text: String, image:UIImage?, completion: @escaping (_ result: [String: AnyObject]?, _ isSuccess: Bool)->()) {
        
        let urlString: String
        
        if image == nil {
            urlString = "https:"
        } else {
            urlString = "AHttps"
        }
        
        let params = ["status": text]
        
        var name: String?
        var data: Data?
        
        if image == nil {
            name = "pic"
            data = image!.pngData()
        }
        
        tokenRequest(method: .POST, URLString: urlString, parameters: params as [String: AnyObject]?, name: name, data: data) { (json, isSuccess) in
            completion(json as? [String: AnyObject], isSuccess)
        }
    }
}

extension WBNetworkManager {
    func loadUserInfo(completion: @escaping (_ dic: [String: AnyObject])->()){
        guard let uid = userAccount.uid else {
            return
        }
        
        let urlString = "xx"
        let params = ["uid": uid]
        
        tokenRequest(URLString: urlString, parameters: params as [String: AnyObject]?) { (json, isSuccess) in
            completion((json as? [String: AnyObject]) ?? [:])
        }
    }
}

extension WBNetworkManager {
    func loadAccessToken(complection: @escaping (_ isSuccess: Bool)->()){
        
        let urlString = ""
        let params = [
            "client_id": "122"
        ]
        
        request(method: .POST, URLString: urlString, parameters: params as [String: AnyObject]?) { (json, isSucess) in
            
            self.userAccount.yy_modelSet(with: (json as? [String: AnyObject]) ?? [:])
            
            self.loadUserInfo { (dict) in
                self.userAccount.yy_modelSet(with: dict)
                
                self.userAccount.saveAccount()
                print(self.userAccount)
                
                complection(isSucess)
            }
            
        }
        
    }
}
