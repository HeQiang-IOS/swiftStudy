//
//  BSRankDetailListViewModel.swift
//  BangSou
//
//  Created by 何强 on 2019/12/9.
//  Copyright © 2019 何强. All rights reserved.
//

import Foundation
class BSRankDetailListViewModel {
    lazy var hostList = [BSRankDetailViewModel]()
    
    
    func loadHostlistData(pullup: Bool, completion: @escaping (_ isSuccess: Bool, _ shouldRefresh: Bool)->()){
        
        BSRankDetailListDAL.loadHotList { (list, isSuccess) in
            if !isSuccess {
                completion(false, false)
                return
            }
            print(list?.count)
            
            var array = [BSRankDetailViewModel]()
            
            for dict in list ?? [] {
                print(dict)
                let inlineModel = BSInlineModel()
                inlineModel.yy_modelSet(with: dict)
                print(inlineModel.name)
                let viewModel = BSRankDetailViewModel(model: inlineModel)
                array.append(viewModel)
            }
            
            print(array)
            
            if pullup {
                self.hostList += array
            } else {
                self.hostList = array + self.hostList
            }
            print(self.hostList[0].inlineModel.name)
            completion(isSuccess, false)
        }
    }
}
