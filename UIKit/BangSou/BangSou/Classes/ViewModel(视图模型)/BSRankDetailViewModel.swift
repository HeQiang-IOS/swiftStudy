//
//  BSRankDetailViewModel.swift
//  BangSou
//
//  Created by 何强 on 2019/12/9.
//  Copyright © 2019 何强. All rights reserved.
//

import Foundation

class BSRankDetailViewModel: CustomStringConvertible {
    var inlineModel: BSInlineModel
    
    init(model: BSInlineModel) {
        self.inlineModel = model
    }
    
    var description: String {
        return inlineModel.description
    }
}
