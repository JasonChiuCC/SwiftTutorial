//
//  Restaurant.swift
//  FoodPin
//
//  Created by dah.com on 2016/1/20.
//  Copyright © 2016年 Jason. All rights reserved.
//

import Foundation
import CoreData

class Restaurant:NSManagedObject {
    @NSManaged var name         :String
    @NSManaged var type         :String
    @NSManaged var location     :String
    @NSManaged var phoneNumber  :String?
    @NSManaged var image        :NSData?    // Binary Data
    @NSManaged var isVisited    :NSNumber?  // 代替 Bool 非0 = true / 0 = false
    @NSManaged var rating       :String?
}

