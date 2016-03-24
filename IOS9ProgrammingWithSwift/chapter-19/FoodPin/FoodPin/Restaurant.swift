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
    var phoneNumber = ""
    var isVisited   = false
    var rating      = ""
    
    init(name:String, type:String, location:String,phoneNumber:String, image:String, isVisited:Bool) {
        self.name           = name
        self.type           = type
        self.location       = location
        self.image          = image
        self.phoneNumber    = phoneNumber
        self.isVisited      = isVisited
    }
}

