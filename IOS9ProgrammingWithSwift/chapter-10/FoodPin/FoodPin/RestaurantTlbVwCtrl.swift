//
//  RestaurantTlbVwCtrl.swift
//  FoodPin
//
//  Created by dah.com on 2016/1/14.
//  Copyright © 2016年 Jason. All rights reserved.
//

import UIKit

class RestaurantTlbVwCtrl: UITableViewController {

    var restaurantNames = ["Cafe Deadend", "Homei", "Teakha", "Cafe Loisl", "Petite Oyster", "For Kee Restaurant", "Po's Atelier", "Bourke Street Bakery", "Haigh's Chocolate", "Palomino Espresso", "Upstate", "Traif", "Graham Avenue Meats", "Waffle & Wolf", "Five Leaves", "Cafe Lore", "Confessional", "Barrafina", "Donostia", "Royal Oak", "Thai Cafe"]
    
    var restaurantImages = ["cafedeadend.jpg", "homei.jpg", "teakha.jpg", "cafeloisl.jpg", "petiteoyster.jpg", "forkeerestaurant.jpg", "posatelier.jpg", "bourkestreetbakery.jpg", "haighschocolate.jpg", "palominoespresso.jpg", "upstate.jpg", "traif.jpg", "grahamavenuemeats.jpg", "wafflewolf.jpg", "fiveleaves.jpg", "cafelore.jpg", "confessional.jpg", "barrafina.jpg", "donostia.jpg", "royaloak.jpg", "thaicafe.jpg"]
    
    var restaurantLocations = ["Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Sydney", "Sydney", "Sydney", "New York", "New York", "New York", "New York", "New York", "New York", "New York", "London", "London", "London", "London"]
    
    var restaurantTypes = ["Coffee & Tea Shop", "Cafe", "Tea House", "Austrian / Causual Drink", "French", "Bakery", "Bakery", "Chocolate", "Cafe", "American / Seafood", "American", "American", "Breakfast & Brunch", "Coffee & Tea", "Coffee & Tea", "Latin American", "Spanish", "Spanish", "Spanish", "British", "Thai"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    /* TLB 中有幾個區塊（可以多個，預設 1 個）[可選方法]*/
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    // MARK: - 提供表格資料
    /* TLB 中每個區段有幾列（Row） */
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurantNames.count
    }

    /* TLB 在顯示時會被呼叫 */
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellId  = "Cell"
        let cell    = tableView.dequeueReusableCellWithIdentifier(cellId, forIndexPath: indexPath) as! RestaurantTlbVwCell
        
        // 設定 cell
        cell.nameLabel.text             = restaurantNames[indexPath.row]
        cell.thumbnailImageView.image   = UIImage(named: restaurantImages[indexPath.row])
        cell.locationLabel.text         = restaurantLocations[indexPath.row]
        cell.typeLabel.text             = restaurantTypes[indexPath.row]
        
        // 設定圖片圓角
        //cell.thumbnailImageView.layer.cornerRadius  = 30.0
        //cell.thumbnailImageView.clipsToBounds       = true
        return cell
    }

    // MARK: - TlbVwDelg
    // 按下某一列被呼叫
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        /* 
          建立一個選單（目前是空的）
          ActionSheet: 選單顯示在下面
          Alert      : 選單顯示在中間
        */
        let optionMenu = UIAlertController(title: nil, message: "你想做什麼", preferredStyle: .Alert)
        
        //（1）加入取消動作到選單中
        let cancelAction = UIAlertAction(title: "取消", style: .Cancel, handler: nil)
        optionMenu.addAction(cancelAction)
        
        //（2）加入打電話動作到選單中
        let callHandler  = { (action:UIAlertAction!) -> Void in
            let Msg = UIAlertController(title: "服務無法使用", message: "對不起", preferredStyle: .Alert)
            Msg.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
            self.presentViewController(Msg, animated: true, completion: nil)
        }
        let callAction   = UIAlertAction(title: "打電話 " + "123-000-\(indexPath.row)", style: .Default, handler: callHandler)
        optionMenu.addAction(callAction)
        
        //（3）加入我來過動作到選單中
        let visitHandler  = { (action:UIAlertAction!) -> Void in
            let cell = tableView.cellForRowAtIndexPath(indexPath)
            cell?.accessoryType = .Checkmark
        }
        let visitAction   = UIAlertAction(title: "我來過了", style: .Default, handler: visitHandler)
        optionMenu.addAction(visitAction)
        
        /* 
          呈現選單
          animated 設為 true 時選單會縮放的感覺
        */
        self.presentViewController(optionMenu, animated: true, completion: nil)
        
    }
    
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}