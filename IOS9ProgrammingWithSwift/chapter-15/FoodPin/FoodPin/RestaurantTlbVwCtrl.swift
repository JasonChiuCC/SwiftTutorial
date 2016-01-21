//
//  RestaurantTlbVwCtrl.swift
//  FoodPin
//
//  Created by dah.com on 2016/1/14.
//  Copyright © 2016年 Jason. All rights reserved.
//

import UIKit

class RestaurantTlbVwCtrl: UITableViewController {

    var restaurants:[Restaurant] = [
        Restaurant(name: "Cafe Deadend", type: "Coffee & Tea Shop", location: "G/F, 72 Po Hing Fong, Sheung Wan, Hong Kong", phoneNumber: "232-923423", image: "cafedeadend.jpg", isVisited: false),
        Restaurant(name: "Homei", type: "Cafe", location: "Shop B, G/F, 22-24A Tai Ping San Street SOHO, Sheung Wan, Hong Kong", phoneNumber: "348-233423", image: "homei.jpg", isVisited: false),
        Restaurant(name: "Teakha", type: "Tea House", location: "Shop B, 18 Tai Ping Shan Road SOHO, Sheung Wan, Hong Kong", phoneNumber: "354-243523", image: "teakha.jpg", isVisited: false),
        Restaurant(name: "Cafe loisl", type: "Austrian / Causual Drink", location: "Shop B, 20 Tai Ping Shan Road SOHO, Sheung Wan, Hong Kong", phoneNumber: "453-333423", image: "cafeloisl.jpg", isVisited: false),
        Restaurant(name: "Petite Oyster", type: "French", location: "24 Tai Ping Shan Road SOHO, Sheung Wan, Hong Kong", phoneNumber: "983-284334", image: "petiteoyster.jpg", isVisited: false),
        Restaurant(name: "For Kee Restaurant", type: "Bakery", location: "Shop J-K., 200 Hollywood Road, SOHO, Sheung Wan, Hong Kong", phoneNumber: "232-434222", image: "forkeerestaurant.jpg", isVisited: false),
        Restaurant(name: "Po's Atelier", type: "Bakery", location: "G/F, 62 Po Hing Fong, Sheung Wan, Hong Kong", phoneNumber: "234-834322", image: "posatelier.jpg", isVisited: false),
        Restaurant(name: "Bourke Street Backery", type: "Chocolate", location: "633 Bourke St Sydney New South Wales 2010 Surry Hills", phoneNumber: "982-434343", image: "bourkestreetbakery.jpg", isVisited: false),
        Restaurant(name: "Haigh's Chocolate", type: "Cafe", location: "412-414 George St Sydney New South Wales", phoneNumber: "734-232323", image: "haighschocolate.jpg", isVisited: false),
        Restaurant(name: "Palomino Espresso", type: "American / Seafood", location: "Shop 1 61 York St Sydney New South Wales", phoneNumber: "872-734343", image: "palominoespresso.jpg", isVisited: false),
        Restaurant(name: "Upstate", type: "American", location: "95 1st Ave New York, NY 10003", phoneNumber: "343-233221", image: "upstate.jpg", isVisited: false),
        Restaurant(name: "Traif", type: "American", location: "229 S 4th St Brooklyn, NY 11211", phoneNumber: "985-723623", image: "traif.jpg", isVisited: false),
        Restaurant(name: "Graham Avenue Meats", type: "Breakfast & Brunch", location: "445 Graham Ave Brooklyn, NY 11211", phoneNumber: "455-232345", image: "grahamavenuemeats.jpg", isVisited: false),
        Restaurant(name: "Waffle & Wolf", type: "Coffee & Tea", location: "413 Graham Ave Brooklyn, NY 11211", phoneNumber: "434-232322", image: "wafflewolf.jpg", isVisited: false),
        Restaurant(name: "Five Leaves", type: "Coffee & Tea", location: "18 Bedford Ave Brooklyn, NY 11222", phoneNumber: "343-234553", image: "fiveleaves.jpg", isVisited: false),
        Restaurant(name: "Cafe Lore", type: "Latin American", location: "Sunset Park 4601 4th Ave Brooklyn, NY 11220", phoneNumber: "342-455433", image: "cafelore.jpg", isVisited: false),
        Restaurant(name: "Confessional", type: "Spanish", location: "308 E 6th St New York, NY 10003", phoneNumber: "643-332323", image: "confessional.jpg", isVisited: false),
        Restaurant(name: "Barrafina", type: "Spanish", location: "54 Frith Street London W1D 4SL United Kingdom", phoneNumber: "542-343434", image: "barrafina.jpg", isVisited: false),
        Restaurant(name: "Donostia", type: "Spanish", location: "10 Seymour Place London W1H 7ND United Kingdom", phoneNumber: "722-232323", image: "donostia.jpg", isVisited: false),
        Restaurant(name: "Royal Oak", type: "British", location: "2 Regency Street London SW1P 4BZ United Kingdom", phoneNumber: "343-988834", image: "royaloak.jpg", isVisited: false),
        Restaurant(name: "Thai Cafe", type: "Thai", location: "22 Charlwood Street London SW1V 2DY Pimlico", phoneNumber: "432-344050", image: "thaicafe.jpg", isVisited: false)
    ]
    
    // 只有第一次視圖顯示時被呼叫
    override func viewDidLoad() {
        super.viewDidLoad()
        // 將返回按鈕的文字清除
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .Plain, target: nil, action: nil)
    }
    
    // 視圖準備要顯示時呼叫
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnSwipe = true
    }

    /* 更改狀態列顏色，只有此試圖控制器有作用
       注意要先去 Target -> Info -> 新增 View controller-based status bar appearance 並關閉才有作用 */
//    override func preferredStatusBarStyle() -> UIStatusBarStyle {
//        return .LightContent
//    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    /* TLB 中有幾個區塊（可以多個，預設 1 個）[可選方法]*/
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    // MARK: - TlbVwDataSource（提供表格資料）
    /* TLB 中每個區段有幾列（Row） */
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurants.count
    }

    /* TLB 在顯示時會被呼叫 */
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellId  = "Cell"
        let cell    = tableView.dequeueReusableCellWithIdentifier(cellId, forIndexPath: indexPath) as! RestaurantTlbVwCell
        
        // 設定 cell
        cell.nameLabel.text             = restaurants[indexPath.row].name
        cell.thumbnailImageView.image   = UIImage(named: restaurants[indexPath.row].image)
        cell.locationLabel.text         = restaurants[indexPath.row].location
        cell.typeLabel.text             = restaurants[indexPath.row].type
        cell.accessoryType              = restaurants[indexPath.row].isVisited ? .Checkmark : .None
        
        // 設定圖片圓角
        //cell.thumbnailImageView.layer.cornerRadius  = 30.0
        //cell.thumbnailImageView.clipsToBounds       = true
        return cell
    }

    // 啟動滑動刪除功能
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // 刪除資料
            restaurants.removeAtIndex(indexPath.row)
            
            // 記得表格視圖要重新載入(以下兩種方法都可以)
            //(1)
            //tableView.reloadData()
            
            //(2)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
    // MARK: - TlbVwDelg
    // 按下某一列被呼叫
    /*
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
        let visitTitle = self.restaurantIsVisit[indexPath.row] ? "我沒來過" : "我來過了"
        let visitHandler  = { (action:UIAlertAction!) -> Void in
            let cell = tableView.cellForRowAtIndexPath(indexPath)
            cell?.accessoryType                     = self.restaurantIsVisit[indexPath.row] ? .None : .Checkmark
            self.restaurantIsVisit[indexPath.row]   = self.restaurantIsVisit[indexPath.row] ? false : true
        }
        let visitAction = UIAlertAction(title: visitTitle, style: .Default, handler: visitHandler)
        optionMenu.addAction(visitAction)
        
        /* 
          呈現選單
          animated 設為 true 時選單會縮放的感覺
        */
        self.presentViewController(optionMenu, animated: true, completion: nil)
        
        // 取消選取後反灰狀態
        tableView.deselectRowAtIndexPath(indexPath, animated: false)
    }
    */
    
    // 表格視圖列的自訂動作，如果有覆寫此方法，tableView(_,commitEditingStyle) 就不會有作用
    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]?{
        // 分享動作
        let shareHandler  = { (action:UITableViewRowAction, indexPath:NSIndexPath) -> Void in
            // 預設使用文字
            let defaultText  = "打卡在：" + self.restaurants[indexPath.row].name
            
            // 預設圖片
            let imageShare   = UIImage(named: self.restaurants[indexPath.row].image)!
            
            // activityItems 內的順序不影響 Facebook 貼文的呈現順序
            let activityCtrl = UIActivityViewController(activityItems: [defaultText,imageShare], applicationActivities: nil)
            self.presentViewController(activityCtrl, animated: true, completion: nil)
        }
        let shareAction = UITableViewRowAction(style: .Default, title: "分享", handler: shareHandler)
        
        // 刪除動作
        let deleteHandler  = { (action:UITableViewRowAction, indexPath:NSIndexPath) -> Void in
            self.restaurants.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
        let deleteAction = UITableViewRowAction(style: .Default, title: "刪除", handler: deleteHandler)
        
        // 設定動作顏色（預設是紅色）
        shareAction.backgroundColor  = UIColor(red: 28.0/255.0,  green: 165.0/255.0, blue: 253.0/255.0, alpha: 1.0) // 藍色
        deleteAction.backgroundColor = UIColor(red: 202.0/255.0, green: 202.0/255.0, blue: 203.0/255.0, alpha: 1.0) // 灰色
        
        // 出現順序會相反 [分享|刪除]
        return [deleteAction,shareAction]
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
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

    // MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showRestaurantDetail" {
            if let indexPath = tableView.indexPathForSelectedRow{
                    let destCtrl = segue.destinationViewController as! RestaurantDetailVwCtrl
                    destCtrl.restaurant = restaurants[indexPath.row]
            }
        }
    }
}
