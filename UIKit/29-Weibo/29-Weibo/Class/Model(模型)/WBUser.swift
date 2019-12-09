//
//  WBUser.swift
//  Weibo
//
//  Created by 何强 on 2019/12/6.
//  Copyright © 2019 何强. All rights reserved.
//

import UIKit

class WBUser: NSObject {
    var id: Int64 = 0
    var screen_name: String?
    var profile_image_url: String?
    var verified_type: Int = 0
    var mbrank: Int = 0
    
    override var description: String {
        return yy_modelDescription()
    }
}
