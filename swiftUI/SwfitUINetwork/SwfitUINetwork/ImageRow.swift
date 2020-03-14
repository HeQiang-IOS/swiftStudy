//
//  ImageRow.swift
//  SwfitUINetwork
//
//  Created by 何强 on 2019/12/12.
//  Copyright © 2019 何强. All rights reserved.
//

import SwiftUI

struct ImageRow: View {
    let model: ImageModel
    var body: some View {
        VStack(alignment: .center) {
            
            ImageViewContainer(imageURL: model.imageURL)
        }
    }
}


