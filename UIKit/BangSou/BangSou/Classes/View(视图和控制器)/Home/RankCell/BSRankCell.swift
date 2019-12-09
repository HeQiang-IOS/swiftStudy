//
//  BSRankCell.swift
//  BangSou
//
//  Created by 何强 on 2019/12/9.
//  Copyright © 2019 何强. All rights reserved.
//

import UIKit

class BSRankCell: UITableViewCell {

    override func awakeFromNib() {
        
        super.awakeFromNib()
        // Initialization code
        
        print("11")
    }

    @IBOutlet weak var rankImageView: UIImageView!
    
    @IBOutlet weak var rankLabel: UILabel!
    
    var bsViewModel: BSRankDetailViewModel? {
        didSet {
            print(bsViewModel!.inlineModel.name)
            print(bsViewModel!.inlineModel)
            rankLabel.text = bsViewModel?.inlineModel.name
            rankImageView.cz_setImage(urlString: bsViewModel?.inlineModel.imgUrl, placeholderImage: UIImage.init(named: "avatar_default_big"))
            
            
            
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
