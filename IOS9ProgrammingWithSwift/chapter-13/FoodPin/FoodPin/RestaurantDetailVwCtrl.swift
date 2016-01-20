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
    
    var restaurant:Restaurant!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        restaurantImageView.image           = UIImage(named: restaurant.image)
        restaurantImageView.clipsToBounds   = true
        restaurantName.text                 = restaurant.name
        restaurantType.text                 = restaurant.type
        restaurantLocation.text             = restaurant.location
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
