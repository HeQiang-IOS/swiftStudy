//
//  WBNetworkManager.swift
//  Weibo
//
//  Created by 何强 on 2019/12/6.
//  Copyright © 2019 何强. All rights reserved.
//

import UIKit
import AFNetworking


enum WBHTTPMethod {
    case GET
    case POST
}

class WBNetworkManager: AFHTTPSessionManager {

    static var shared: WBNetworkManager {
        let instance = WBNetworkManager()
        instance.responseSerializer.acceptableContentTypes?.insert("text/plain")
        return instance
    }
    
    lazy var userAccount = WBUserAccount()
    
    var userLogin: Bool {
        return userAccount.access_token != nil
    }
    
    func tokenRequest(method: WBHTTPMethod = .GET, URLString: String, parameters: [String:AnyObject]?, name: String? = nil, data: Data? = nil, completion: @escaping (_ json: Any?, _ isSuccess: Bool)->()){
        guard let token = userAccount.access_token else { return
            print("没有token！ 需要登录")
            
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: WBUserShouldLoginNotification), object: nil)
            
            completion(nil, false)
            
            return
        }
        
        var parameters = parameters
        if parameters == nil {
            parameters = [String: AnyObject]()
        }
        
        parameters!["access_token"] = token as AnyObject?
        
        if let name = name, let data = data {
            upload(URLString: URLString, parameters: parameters, name: name, data: data, completion: completion)
        } else {
            request(method: method, URLString: URLString, parameters: parameters, completion: completion)
        }
        
        
    }
    
    func upload(URLString:String, parameters: [String: AnyObject]?, name: String, data: Data, completion: @escaping (_ json: AnyObject?, _ isSuccess: Bool)->()) {
        
        self.post(URLString, parameters: parameters, constructingBodyWith: { (formData) in
            
            formData.appendPart(withFileData: data, name: name, fileName: "xxx", mimeType: "application/octet-stream")
        }, progress: nil, success: { (json, _) in
            completion(json, true)
        }) { (task, error) in
            if (task?.response as? HTTPURLResponse)?.statusCode == 403 {
                print("Token 过期了")
                
                NotificationCenter.default.post(name: Notification.Name(rawValue: WBUserShouldLoginNotification), object: "bad token")
                
            }
            print("网络请求错误 \(error)")
            completion(nil, false)
            
        }
    }
    
    func request(method: WBHTTPMethod = .GET, URLString: String, parameters: [String: AnyObject]?, completion: @escaping (_ json: Any?, _ isSuccess: Bool)->()) {
        
        let suceess = {
            (task: URLSessionDataTask, json: Any?)->() in
            completion(json, true)
        }
        
        let failure = {
            (task: URLSessionDataTask?, error: Error)->() in
            
            if (task?.response as? HTTPURLResponse)?.statusCode == 403 {
                print("Token 过期了")
                
                NotificationCenter.default.post(name: Notification.Name(rawValue: WBUserShouldLoginNotification), object: "bod token")
                
            }
            
            print("网络请求错误 \(error)")
            completion(nil, false)
        }
        
        if method == .GET {
            self.get(URLString, parameters: parameters, progress: nil, success: suceess, failure: failure)
        } else {
            self.post(URLString, parameters: parameters, progress: nil, success: suceess, failure: failure)
        }
    }
}
