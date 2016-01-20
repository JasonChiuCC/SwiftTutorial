//
//  RestaurantDetailVwCtrl.swift
//  FoodPin
//
//  Created by dah.com on 2016/1/19.
//  Copyright © 2016年 Jason. All rights reserved.
//

import UIKit

class RestaurantDetailVwCtrl: UIViewController {
    
      @IBOutlet weak var restaurantImageView  : UIImageView!
//    @IBOutlet weak var restaurantType       : UILabel!
//    @IBOutlet weak var restaurantLocation   : UILabel!
//    @IBOutlet weak var restaurantName       : UILabel!

    var restaurant:Restaurant!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        restaurantImageView.image           = UIImage(named: restaurant.image)
        restaurantImageView.clipsToBounds   = true
//        restaurantName.text                 = restaurant.name
//        restaurantType.text                 = restaurant.type
//        restaurantLocation.text             = restaurant.location
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension RestaurantDetailVwCtrl:UITableViewDataSource,UITableViewDelegate {
    // MARK: - TlbVwDataSource（提供表格資料）
    /* TLB 中每個區段有幾列（Row） */
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    /* TLB 在顯示時會被呼叫 */
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellId  = "Cell"
        let cell    = tableView.dequeueReusableCellWithIdentifier(cellId, forIndexPath: indexPath) as! RestaurantDetailTlbVwCell
        
        // 設定 cell
        switch (indexPath.row) {
        case 0:
            cell.fieldLabel.text = "名稱"
            cell.valueLabel.text = restaurant.name
        case 1:
            cell.fieldLabel.text = "類型"
            cell.valueLabel.text = restaurant.type
        case 2:
            cell.fieldLabel.text = "地點"
            cell.valueLabel.text = restaurant.location
        case 3:
            cell.fieldLabel.text = "是否來過"
            cell.valueLabel.text = restaurant.isVisited ? "來過了" : "沒來過"
        default:
            cell.fieldLabel.text = ""
            cell.valueLabel.text = ""
        }

        // 設定圖片圓角
        //cell.thumbnailImageView.layer.cornerRadius  = 30.0
        //cell.thumbnailImageView.clipsToBounds       = true
        return cell
    }
}