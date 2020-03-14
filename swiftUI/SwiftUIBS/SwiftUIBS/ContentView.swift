//
//  ContentView.swift
//  SwiftUIBS
//
//  Created by 何强 on 2019/12/18.
//  Copyright © 2019 何强. All rights reserved.
//

import SwiftUI
import Combine

struct ContentView: View {
    @ObservedObject var homeListViewModel = HomeListViewModel()
    
    
    
    var body: some View {
        NavigationView {
            List{
                ForEach(homeListViewModel.hostList) {
                    item in
                    NavigationLink(destination: RankDetailView(id: item.homeModel.id ?? "1")) {
                        HStack(spacing: 10.0) {
                            ImageViewContainer(imageURL: item.homeModel.imgUrl ?? "")
                             .frame(width: 80, height: 80)
                            
                            VStack(alignment: .leading, spacing: 8.0) {
                                Text(item.homeModel.name ?? "")
                                    .font(.headline)
                                    .lineLimit(1)
                                Text(item.homeModel.name ?? "")
                                    .font(.subheadline)
                                    .lineLimit(1)
                            }
                        }
                    }
                }
            }
            .navigationBarTitle("榜搜")
        }
        .onAppear{
            self.homeListViewModel.loadHostListData()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
