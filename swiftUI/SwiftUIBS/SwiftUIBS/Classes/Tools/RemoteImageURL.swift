//
//  RemoteImageURL.swift
//  SwiftUIBS
//
//  Created by 何强 on 2019/12/18.
//  Copyright © 2019 何强. All rights reserved.
//

import SwiftUI
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
