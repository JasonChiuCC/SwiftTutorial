//
//  Restaurant.swift
//  FoodPin
//
//  Created by dah.com on 2016/1/20.
//  Copyright © 2016年 Jason. All rights reserved.
//

import Foundation

class Restaurant {
    var name        = ""
    var type        = ""
    var location    = ""
    var image       = ""
    var tel         = ""
    var isVisited   = false
    
    init(name:String, type:String, location:String, image:String,tel:String, isVisited:Bool) {
        self.name       = name
        self.type       = type
        self.location   = location
        self.image      = image
        self.tel        = tel
        self.isVisited  = isVisited
    }
}

