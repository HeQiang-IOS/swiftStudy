//
//  ImageViewContainer.swift
//  SwfitUINetwork
//
//  Created by 何强 on 2019/12/12.
//  Copyright © 2019 何强. All rights reserved.
//

import SwiftUI
import Foundation
import Combine

struct ImageViewContainer: View {
    
    @ObservedObject var remoteImageURL: RemoteImageURL
    init(imageURL: String) {
        remoteImageURL = RemoteImageURL(imageURL: imageURL)
    }
    
    var body: some View {
        
        Image(uiImage: (remoteImageURL.data.isEmpty) ? UIImage(imageLiteralResourceName: "lake") : UIImage(data: remoteImageURL.data)!)
        .resizable()
            .aspectRatio(contentMode: .fit)
        .frame(width: 250, height: 250)
        
    }
}


