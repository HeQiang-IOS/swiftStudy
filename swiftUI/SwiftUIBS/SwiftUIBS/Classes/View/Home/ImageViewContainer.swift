//
//  ImageViewContainer.swift
//  SwiftUIBS
//
//  Created by 何强 on 2019/12/18.
//  Copyright © 2019 何强. All rights reserved.
//

import SwiftUI
import Combine

struct ImageViewContainer: View {
    @ObservedObject var remoteImageURL: RemoteImageURL
    
    init(imageURL: String) {
        remoteImageURL = RemoteImageURL(imageURL: imageURL)
    }
    
    var body: some View {
        Image(uiImage:
            (remoteImageURL.data.isEmpty) ? UIImage(imageLiteralResourceName: "IconHome") : UIImage(data: remoteImageURL.data)!)
            .resizable()
            .aspectRatio(contentMode: .fit)
           
        
    }
}

