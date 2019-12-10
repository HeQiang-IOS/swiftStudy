//
//  CategoryRow.swift
//  App-Design-and-Layout
//
//  Created by 何强 on 2019/12/10.
//  Copyright © 2019 何强. All rights reserved.
//

import SwiftUI

struct CategoryRow: View {
    var categoryName: String
    var items: [Landmark]
    
    var body: some View {
        //        Text(self.categoryName).font(.headline)
        
        VStack(alignment: .leading) {
            Text(self.categoryName)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0){
                    ForEach(self.items) {
                        landmark in
                        //                        Text(landmark.name)
//                            CategoryItem(landmark: landmark)
                        NavigationLink(destination: LandmarkDetail(landmark: landmark
                        )) {
                            CategoryItem(landmark: landmark)
                        }
                        
                    }
                }
            }.frame(height: 185)
        }
    }
}


struct CategoryItem: View {
    var landmark: Landmark
    // 我们作为nav的label传递的文字会使用环境的强调渲染，并且图像可能会被当做template image
    var body: some View {
        VStack(alignment: .leading) {
            landmark.image
                .renderingMode(.original)
                .resizable()
                .frame(width: 155, height: 155)
                .cornerRadius(5)
            
            Text(landmark.name)
                .foregroundColor(.primary)
                .font(.caption)
        }.padding(.leading, 15)
    }
}

struct CategoryRow_Previews: PreviewProvider {
    static var previews: some View {
        CategoryRow(
            categoryName: landmarkData[0].category.rawValue, items: Array(landmarkData.prefix(4))
        )
    }
}
