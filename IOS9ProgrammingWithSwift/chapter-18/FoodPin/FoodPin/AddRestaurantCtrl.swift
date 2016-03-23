//
//  AddRestaurantCtrl.swift
//  FoodPin
//
//  Created by dah.com on 2016/3/16.
//  Copyright © 2016年 Jason. All rights reserved.
//

import UIKit

class AddRestaurantCtrl: UITableViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    /* 其中一個 Cell 被點到會執行 didSelect */
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        // 判斷是不是第一個 Cell
        if indexPath.row == 0 {
            if UIImagePickerController.isSourceTypeAvailable(.PhotoLibrary) {
                let imagePicker = UIImagePickerController()   // 建立實體
                imagePicker.allowsEditing   = false
                imagePicker.sourceType      = .PhotoLibrary
                imagePicker.delegate        = self
                self.presentViewController(imagePicker, animated: true, completion: nil)
            }
        }
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }


    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...

        return cell
    }
    */

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

// 使用代理目的是要和 UIImagePickerController 實體溝通
extension AddRestaurantCtrl:UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    // 照片庫點選照片後會呼叫此方法
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        imageView.image         = info[UIImagePickerControllerOriginalImage] as? UIImage
        imageView.contentMode   = UIViewContentMode.ScaleAspectFill
        imageView.clipsToBounds = true
        
        // 以下為約束條件
        let leadingConstraint   = NSLayoutConstraint(item: imageView,           attribute: NSLayoutAttribute.Leading, relatedBy: NSLayoutRelation.Equal,
                                                   toItem: imageView.superview, attribute: NSLayoutAttribute.Leading, multiplier: 1, constant: 0)
        
        let trailingConstraint  = NSLayoutConstraint(item: imageView,           attribute: NSLayoutAttribute.Trailing, relatedBy: NSLayoutRelation.Equal,
                                                   toItem: imageView.superview, attribute: NSLayoutAttribute.Trailing, multiplier: 1, constant: 0)
        
        let topConstraint       = NSLayoutConstraint(item: imageView,           attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal,
                                                   toItem: imageView.superview, attribute: NSLayoutAttribute.Top, multiplier: 1, constant: 0)
        
        let bottomConstraint    = NSLayoutConstraint(item: imageView,           attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal,
                                                   toItem: imageView.superview, attribute: NSLayoutAttribute.Bottom, multiplier: 1, constant: 0)
        
        leadingConstraint.active    = true
        trailingConstraint.active   = true
        topConstraint.active        = true
        bottomConstraint.active     = true
        dismissViewControllerAnimated(true, completion: nil)// 關閉照片挑選器
    }
}





