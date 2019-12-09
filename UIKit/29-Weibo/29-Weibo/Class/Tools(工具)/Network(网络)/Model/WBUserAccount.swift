//
//  WBUserAccount.swift
//  Weibo
//
//  Created by 何强 on 2019/12/6.
//  Copyright © 2019 何强. All rights reserved.
//

import UIKit
import YYModel


private let accountFile: NSString = "useraccount.json"

class WBUserAccount: NSObject {
    var access_token: String?
    var uid: String?
    var expires_in: TimeInterval = 0 {
        didSet {
            expiresDate = Date(timeIntervalSinceNow: expires_in)
        }
    }
    
    
    var expiresDate: Date?
    
    var screen_name: String?
    
    var avatar_large: String?
    
    
    override var description: String {
        return yy_modelDescription()
    }
    
    override init() {
        super.init()
        
        guard let path = accountFile.cz_appendDocumentDir(),
        let data = NSData.init(contentsOfFile: path),
            let dict = try? JSONSerialization.jsonObject(with: data as Data, options: []) as? [String: AnyObject]
        else {
            return
        }
        
        yy_modelSet(with: dict ?? [:])
        
        if expiresDate?.compare(Date()) != .orderedDescending {
            access_token = nil
            uid = nil
            _ = try? FileManager.default.removeItem(atPath: path)
        }
    }
    
    func saveAccount() {
        var dict = (self.yy_modelToJSONObject() as? [String: AnyObject]) ?? [:]
        
        dict.removeValue(forKey: "expires_in")
        
        guard let data = try? JSONSerialization.data(withJSONObject: dict, options: []),
            let filePath = accountFile.cz_appendDocumentDir()
        else {
            return
        }
        
        (data as NSData).write(toFile: filePath, atomically: true)
    }
}
