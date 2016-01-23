//
//  RestaurantTlbVwCell.swift
//  FoodPin
//
//  Created by dah.com on 2016/1/14.
//  Copyright © 2016年 Jason. All rights reserved.
//

import UIKit

class RestaurantTlbVwCell: UITableViewCell {
    
    @IBOutlet var nameLabel             : UILabel!
    @IBOutlet var locationLabel         : UILabel!
    @IBOutlet var typeLabel             : UILabel!
    @IBOutlet var thumbnailImageView    : UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
