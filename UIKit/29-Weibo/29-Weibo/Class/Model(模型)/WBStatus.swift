//
//  WBStatus.swift
//  Weibo
//
//  Created by 何强 on 2019/12/6.
//  Copyright © 2019 何强. All rights reserved.
//

import UIKit
import YYModel

class WBStatus: NSObject {
    var id: Int64 = 0
    
    var text: String?
    var created_at: String? {
        didSet {
            createDate = Date.cz_sinaDate(string: created_at ?? "")
        }
    }
    
    var createDate: Date?
    var source: String? {
        didSet {
            source = "来自于" + (source?.cz_href()?.text ?? "")
        }
    }
    
    var reposts_count: Int = 0
    var comments_count: Int = 0
    var attitudes_count: Int = 0
    
    var user: WBUser?
    var retweeted_status: WBStatus?
    var pic_urls: [WBStatusPicture]?
    
    override var description: String {
        return yy_modelDescription()
    }

    
    class func modelContainerPropertyGenericClass() -> [String: AnyClass] {
        return ["pic_urls": WBStatusPicture.self]
    }
}
