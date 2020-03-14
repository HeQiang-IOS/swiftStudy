//
//  HomeViewModel.swift
//  SwiftUIBS
//
//  Created by 何强 on 2019/12/18.
//  Copyright © 2019 何强. All rights reserved.
//

import SwiftUI

class HomeViewModel: CustomStringConvertible, Identifiable {
    var id = UUID()
    var homeModel: HomeModel
    
    init(model: HomeModel) {
        self.homeModel = model
    }
    
    var description: String {
        return homeModel.description
    }
}
