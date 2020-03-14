//
//  UpdateDetail.swift
//  UIDemo
//
//  Created by 何强 on 2019/12/17.
//  Copyright © 2019 何强. All rights reserved.
//

import SwiftUI

struct UpdateDetail: View {
    var title = "SwiftUI"
    var text = "Loading"
    var image = "Illustration1"
    
    var body: some View {
        VStack {
            Text(title)
                .font(.largeTitle)
                .fontWeight(.heavy)
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 200.0)
            
            Text(text)
                .lineLimit(nil)
                .frame(minWidth:0, maxWidth: .infinity, alignment: .leading)
//            Spacer()
        }
        .padding(30.0)
    }
}

struct UpdateDetail_Previews: PreviewProvider {
    static var previews: some View {
        UpdateDetail()
    }
}
