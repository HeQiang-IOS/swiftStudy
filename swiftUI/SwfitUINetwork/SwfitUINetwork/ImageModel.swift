//
//  ImageModel.swift
//  SwfitUINetwork
//
//  Created by 何强 on 2019/12/12.
//  Copyright © 2019 何强. All rights reserved.
//

import SwiftUI
import Combine

struct ImageModel: Identifiable {
    var id = UUID()
    var imageURL: String
    
    static let imageURLArray: [ImageModel] = [
    .init(imageURL: "http://p1.meituan.net/tdctraveldark/ceaaff0a2457a031f4f0bd3f5072df7a210230.png%40340w_255h_1e_1c_1l%7Cwatermark%3D0"),
    .init(imageURL: "http://p1.meituan.net/tdctraveldark/ceaaff0a2457a031f4f0bd3f5072df7a210230.png%40340w_255h_1e_1c_1l%7Cwatermark%3D0"),
    .init(imageURL: "http://p1.meituan.net/tdctraveldark/ceaaff0a2457a031f4f0bd3f5072df7a210230.png%40340w_255h_1e_1c_1l%7Cwatermark%3D0"),
    .init(imageURL: "http://p1.meituan.net/tdctraveldark/ceaaff0a2457a031f4f0bd3f5072df7a210230.png%40340w_255h_1e_1c_1l%7Cwatermark%3D0")
    ]
}
