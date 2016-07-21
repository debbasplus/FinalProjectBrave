//
//  ads.swift
//  Brave
//
//  Created by Rami debbas on 2016-07-19.
//  Copyright © 2016 Debbasplus. All rights reserved.
//

import UIKit

struct ads {
    let adsImage: String
    let sharedName: String
    let actionType: String
    let adsTitle: String
    let adsCoverImage: String
    let adsSouce: String
    let adsTime: String
}

class adsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var adsImage: UIImageView!
    @IBOutlet weak var sharedNameLabel: UILabel!
    @IBOutlet weak var actionTypeLabel: UILabel!
    @IBOutlet weak var adsCoverImage: UIImageView!
    
    @IBOutlet weak var adsTitleLabel: UILabel!
    @IBOutlet weak var adsSouceLabel: UILabel!
    @IBOutlet weak var adsCreatedAtLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
