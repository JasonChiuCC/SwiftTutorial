//
//  RestaurantDetailVwCtrl.swift
//  FoodPin
//
//  Created by dah.com on 2016/1/19.
//  Copyright © 2016年 Jason. All rights reserved.
//

import UIKit

class RestaurantDetailVwCtrl: UIViewController {

    @IBOutlet weak var restaurantType       : UILabel!
    @IBOutlet weak var restaurantLocation   : UILabel!
    @IBOutlet weak var restaurantName       : UILabel!
    @IBOutlet weak var restaurantImageView  : UIImageView!
    
    var restaurantImage = ""
    var resName         = ""
    var resLocation     = ""
    var resType         = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        restaurantImageView.image   = UIImage(named: restaurantImage)
        restaurantName.text         = resName
        restaurantType.text         = resType
        restaurantLocation.text     = resLocation
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
