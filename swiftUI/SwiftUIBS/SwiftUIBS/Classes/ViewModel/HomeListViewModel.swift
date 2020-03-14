//
//  HomeListViewModel.swift
//  SwiftUIBS
//
//  Created by 何强 on 2019/12/18.
//  Copyright © 2019 何强. All rights reserved.
//

import SwiftUI
import Combine
import YYModel

class HomeListViewModel: ObservableObject {
    
    @Published var hostList = [HomeViewModel]()
    
    @Published var rankDetail = HomeViewModel(model: HomeModel())
    
    @Published var rankDatas = [RankDetailModel]()
    
    
    
    func loadHostListData(){
        HomeListViewModelDAL.loadHotList { (list, isSuccess) in
            
            if !isSuccess {
                return
            }
            
            var array = [HomeViewModel]()
            
            for dict in list ?? [] {
                let homeModel = HomeModel()
                homeModel.yy_modelSet(with: dict)
                let viewModel = HomeViewModel(model: homeModel)
                array.append(viewModel)
            }
            
            self.hostList = array;
        }
    }
    
    
    func loadRankDetail(id: String) {
        HomeListViewModelDAL.loadRankDetal(id: id) { (json, isSuccess) in
            if !isSuccess {
                return
            }
            
            let homeModel = HomeModel()
            homeModel.yy_modelSet(with: json!)
            
            self.rankDetail = HomeViewModel(model: homeModel)
            self.rankDatas = self.rankDetail.homeModel.rankDetailList ?? []
            print(self.rankDetail.homeModel.rankDetailList?.count ?? 0)
            
           
        }
    }
}
