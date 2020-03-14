//
//  RemoteImageURL.swift
//  SwfitUINetwork
//
//  Created by 何强 on 2019/12/12.
//  Copyright © 2019 何强. All rights reserved.
//

import SwiftUI
import Foundation
import Combine


class RemoteImageURL: ObservableObject {
    
    @Published var data = Data()
    
    init(imageURL: String) {
        guard let url = URL(string: imageURL) else {
            return
        }
        
        URLSession.shared.dataTask(with: url){
            (data, response, error) in
            guard let data = data else {
                return
            }
            DispatchQueue.main.async {
                self.data = data
            }
        }.resume()
    }
    
}


