//
//  WBStatusListViewModel.swift
//  Weibo
//  微博数据列表视图模型
//  Created by 何强 on 2019/12/9.
//  Copyright © 2019 何强. All rights reserved.
//

import Foundation
import SDWebImage


private let maxPullupTryTimes = 3

class WBStatusListViewModel {
    
    lazy var statusList = [WBStatusViewModel]()
    
    private var pullupErrorTimes = 0
    
    
    func loadStatus(pullup: Bool, completion: @escaping (_ isSuccess: Bool, _ shouldRefresh: Bool)->()){
        
        if pullup && pullupErrorTimes > maxPullupTryTimes {
            completion(true, true)
            
            return
        }
        
        let since_id = pullup ? 0 : (statusList.first?.status.id ?? 0)
        
        let max_id = !pullup ? 0 : (statusList.last?.status.id ?? 0)
        
        WBStatusListDAL.loadStatus(since_id: since_id, max_id: max_id) { (list, isSuccess) in
            if !isSuccess {
                completion(false, false)
                return
            }
            
            var array = [WBStatusViewModel]()
            
            for dict in list ?? [] {
                let status = WBStatus()
                status.yy_modelSet(with: dict)
                
                let viewModel = WBStatusViewModel(model: status)
                
                array.append(viewModel)
            }
            
            
            if pullup {
                self.statusList += array
            } else {
                self.statusList = array + self.statusList
            }
            
            if pullup && array.count == 0 {
                self.pullupErrorTimes += 1
                completion(isSuccess, false)
            } else {
//                self.cacheSingleImage(list: array, finished: completion)
            }
        }
        
    }
    
    /*
    private func cacheSingleImage(list: [WBStatusViewModel], finished: @escaping (_ isSuccess: Bool, _ shouldRefresh: Bool)->()) {
        let group = DispatchGroup()
        
        var length = 0
        
        for vm in list {
            if vm.picURLs.count != 1 {
                continue
            }
            
            guard let pic = vm.picURLs[0].thumbnail_pic,
                let url = URL.init(string: pic) else {
                continue
            }
            
            group.enter()
            
            SDWebImageManager.shared().downloadImage(with: url, options: [], progress: nil, completed: { (image, _, _, _, _) in
                           
                           // 将图像转换成二进制数据
                           if let image = image,
                               let data = UIImagePNGRepresentation(image) {
                               
                               // NSData 是 length 属性
                               length += data.count
                               
                               // 图像缓存成功，更新配图视图的大小
                               vm.updateSingleImageSize(image: image)
                           }
                           
                           print("缓存的图像是 \(image) 长度 \(length)")
                           
                           // B> 出组 - 放在回调的最后一句
                           group.leave()
                       })
        }
        
        group.notify(queue: DispatchQueue.main) {
            finished(true, true)
        }
    }
 */
}
