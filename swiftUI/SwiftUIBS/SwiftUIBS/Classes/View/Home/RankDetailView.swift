//
//  RankDetailView.swift
//  SwiftUIBS
//
//  Created by 何强 on 2019/12/18.
//  Copyright © 2019 何强. All rights reserved.
//

import SwiftUI

struct RankDetailView: View {
    var id: String = "1"
    static var indexHQ: Int = 1
    @ObservedObject var homeListViewModel = HomeListViewModel()
    
    var body: some View {
        List {
//            Image("Illustration1")
//                .resizable()
//                .aspectRatio(contentMode: .fit)
            
             ImageViewContainer(imageURL: homeListViewModel.rankDetail.homeModel.imgUrl ?? "")
            .listRowInsets(EdgeInsets())
            
            Text(homeListViewModel.rankDetail.homeModel.name  ?? "")
//            .listRowInsets(EdgeInsets())
//            Text("\(homeListViewModel.rankDetail.homeModel.rankDetailList?.count ?? 0)")
            
            ForEach(homeListViewModel.rankDetail.homeModel.rankDetailList ?? []){
                item in
                HStack {
//                    Text("\(RankDetailView.indexHQ)")
                    Text(item.name ?? "")
                        .lineLimit(1)
                        .padding(.leading, 10.0)
                        .frame(height: 50.0)
                    
                    Spacer()
                }
                .background(Color.gray)
                .shadow(radius: 10)
                .cornerRadius(10)
                .padding(.all, 4.0)
            }
//                .listRowInsets(EdgeInsets())
           
        }
        .navigationBarTitle(Text(homeListViewModel.rankDetail.homeModel.name  ?? ""), displayMode: .inline)
        .onAppear{
            UITableView.appearance().separatorStyle = .none
            self.homeListViewModel.loadRankDetail(id: self.id)
        }
        .onDisappear{
            UITableView.appearance().separatorStyle = .singleLine
        }
    }
}

struct RankDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RankDetailView()
    }
}
