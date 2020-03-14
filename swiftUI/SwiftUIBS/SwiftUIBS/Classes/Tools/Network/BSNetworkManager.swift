//
//  BSNetworkManager.swift
//  SwiftUIBS
//
//  Created by 何强 on 2019/12/18.
//  Copyright © 2019 何强. All rights reserved.
//

import SwiftUI
import AFNetworking


enum BSHTTPMethod {
    case GET
    case POST
}

class BSNetworkManager: AFHTTPSessionManager {
    
    static var shared: BSNetworkManager {
        let instance = BSNetworkManager()
        instance.responseSerializer.acceptableContentTypes?.insert("text/plain")
        return instance
    }
    
    func requset(method: BSHTTPMethod = .GET, URLString: String, parameters: [String: AnyObject]?, completion: @escaping (_ json: Any?, _ isSuccess: Bool)->()){
        
        let success = {
            (task: URLSessionDataTask, json: Any?) ->() in
            completion(json, true)
        }
        
        let failure = {
            (task: URLSessionDataTask?, error: Error)->() in
            completion(nil, false)
        }
        
        
        if method == .GET {
            self.get(URLString, parameters: parameters, progress: nil, success: success, failure: failure)
        } else {
            self.post(URLString, parameters: parameters, progress: nil, success: success, failure: failure)
        }
    }
}
