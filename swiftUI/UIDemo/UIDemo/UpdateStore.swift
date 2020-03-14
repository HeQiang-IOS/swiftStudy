//
//  UpdateStore.swift
//  UIDemo
//
//  Created by 何强 on 2019/12/17.
//  Copyright © 2019 何强. All rights reserved.
//

import SwiftUI
import Combine

class UpdateStore: ObservableObject {
    @Published var updates =  [Update]()
    
}


