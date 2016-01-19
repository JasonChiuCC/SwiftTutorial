//
//  RestaurantDetailVwCtrl.swift
//  FoodPin
//
//  Created by dah.com on 2016/1/19.
//  Copyright © 2016年 Jason. All rights reserved.
//

import UIKit

class RestaurantDetailVwCtrl: UIViewController {

    @IBOutlet weak var restaurantImageView: UIImageView!
    var restaurantImage = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        restaurantImageView.image = UIImage(named: restaurantImage)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
