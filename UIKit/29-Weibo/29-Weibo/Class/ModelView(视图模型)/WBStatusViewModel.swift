//
//  WBStatusViewModel.swift
//  Weibo
//  单条微博的视图模型
//  Created by 何强 on 2019/12/9.
//  Copyright © 2019 何强. All rights reserved.
//

import UIKit

class WBStatusViewModel: CustomStringConvertible {
    
    var description: String {
        return status.description
    }
    
    var status: WBStatus
    
    var memberIcon: UIImage?
    
    var vipIcon: UIImage?
    
    var retweetedStr: String?
    
    var commentStr: String?
    
    var likeStr: String?
    
    var pictureViewSize = CGSize()
    
    var picURLs: [WBStatusPicture]{
        return status.retweeted_status?.pic_urls ?? status.pic_urls!
    }
    
    var statusAttrText: NSAttributedString?
    
    var retweetedAttrText: NSAttributedString?
    
    var rowHeight: CGFloat = 0
    
    init(model: WBStatus) {
        self.status = model
        
        if (model.user?.mbrank)! > 0 && (model.user?.mbrank)! < 7 {
            let imageName = "common_icon_membership_level\(model.user?.mbrank ?? 1)"
            memberIcon = UIImage.init(named: imageName)
        }
        
        switch model.user?.verified_type ?? -1 {
        case 0:
            vipIcon = UIImage.init(named: "avatar_vip")
        case 2, 3, 5:
            vipIcon = UIImage.init(named: "avatar_enterprise_vip")
        case 220:
            vipIcon = UIImage.init(named: "avatar_grassroot")
        default:
            break
        }
        
        
        retweetedStr = countString(count: model.reposts_count, defaultStr: "转发")
        commentStr = countString(count: model.comments_count, defaultStr: "评论")
        likeStr = countString(count: model.attitudes_count, defaultStr: "赞")
        
        pictureViewSize = calcPictureViewSize(count: picURLs.count)
        
        let originalFont = UIFont.systemFont(ofSize: 15)
        let retweetedFont = UIFont.systemFont(ofSize: 14)
        
        
        statusAttrText = CZEmoticonManager.shared.emoticonString(string: model.text ?? "", font: originalFont)
        
    
        var rText = "@"
           rText += (status.retweeted_status?.user?.screen_name ?? "")
           rText += ":"
           rText += (status.retweeted_status?.text ?? "")
        
        retweetedAttrText = CZEmoticonManager.shared.emoticonString(string: rText, font: retweetedFont)
        
        updateRowHeight()
    }
    
    
    
    private func countString(count: Int, defaultStr: String) -> String {
        if count == 0 {
            return defaultStr
        }
        
        if count < 10000 {
            return count.description
        }
        
        return String.init(format: "%.02f 万", Double(count) / 10000)
        
    }
    
    
    private func calcPictureViewSize(count: Int?) -> CGSize {
        if count == 0 || count == nil {
            return CGSize()
        }
        
        let row = (count! - 1) / 3 + 1
        
        var height = WBStatusPictureViewOutterMargin
        height += CGFloat(row) * WBStatusPictureItemWidth
        height += CGFloat(row - 1) * WBStatusPictureViewInnerMargin
        
        return CGSize.init(width: WBStatusPictureViewWidth, height: height)
    }
    
    
    func updateSingleImageSize(image: UIImage) {
        var size = image.size
        
        let maxWidth: CGFloat = 200
        let minWidth: CGFloat = 40
        
        if size.width > maxWidth {
            size.width = 200
            size.height = size.width * image.size.height / image.size.width
        }
        
        if size.width < minWidth {
            size.width = minWidth
            size.height = size.width * image.size.height / image.size.width / 4
        }
        
        if size.height > 200 {
            size.height = 200
        }
        
        size.height += WBStatusPictureViewOutterMargin
        
        pictureViewSize = size
        
        updateRowHeight()
    }
    
    
    func updateRowHeight() {
        let margin: CGFloat = 12
        let iconHeight: CGFloat = 34
        let toolbarHeight: CGFloat = 35
        
        var height: CGFloat = 0
        
        let viewSize = CGSize.init(width: UIScreen.cz_screenWidth() - 2 * margin, height: CGFloat(MAXFLOAT))
        
        height = 2 * margin + iconHeight + margin
        
        if let text = statusAttrText {
            height += text.boundingRect(with: viewSize, options: [.usesLineFragmentOrigin], context: nil).height
        }
        
        if status.retweeted_status != nil {
            height += 2 * margin
            if let text = retweetedAttrText {
                  height += text.boundingRect(with: viewSize, options: [.usesLineFragmentOrigin], context: nil).height
            }
        }
        
        height += pictureViewSize.height
        height += margin
        height += toolbarHeight
        rowHeight = height
        
    }

}
