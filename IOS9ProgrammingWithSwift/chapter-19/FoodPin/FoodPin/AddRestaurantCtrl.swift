//
//  AddRestaurantCtrl.swift
//  FoodPin
//
//  Created by dah.com on 2016/3/16.
//  Copyright © 2016年 Jason. All rights reserved.
//

import UIKit
import CoreData

class AddRestaurantCtrl: UITableViewController {

    @IBOutlet weak var imageView            : UIImageView!
    @IBOutlet weak var nameTextField        : UITextField!
    @IBOutlet weak var typeTextField        : UITextField!
    @IBOutlet weak var locationTextField    : UITextField!
    @IBOutlet weak var yesButton            : UIButton!
    @IBOutlet weak var noButton             : UIButton!
    var isVisited = true
    var restaurant:Restaurant!
    
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
    
    @IBAction func toggleBeenHereButton(sender: UIButton) {
        // Yes button clicked
        if sender == yesButton {
            isVisited = true
            yesButton.backgroundColor = UIColor(red: 235.0/255.0, green: 73.0/255.0, blue: 27.0/255.0, alpha: 1.0)
            noButton.backgroundColor = UIColor.grayColor()
        } else if sender == noButton {
            isVisited = false
            yesButton.backgroundColor = UIColor.grayColor()
            noButton.backgroundColor = UIColor(red: 235.0/255.0, green: 73.0/255.0, blue: 27.0/255.0, alpha: 1.0)
        }
    }
    
    @IBAction func save(sender: AnyObject) {
        let name        = nameTextField.text
        let type        = typeTextField.text
        let location    = locationTextField.text
        
        // Validate input fields
        if name == "" || type == "" || location == "" {
            let alertController = UIAlertController(title: "喔喔！", message: "有些欄位沒有填寫", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "確定", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alertController, animated: true, completion: nil)
            
            return
        }
        
        // Print input data to console
        print("名稱: \(name)")
        print("類型: \(type)")
        print("地點: \(location)")
        print("是否來過: \(isVisited)")
        
        
        // 使用 CoreData 儲存
        if let managedObjectContext = (UIApplication.sharedApplication().delegate as? AppDelegate )?.managedObjectContext { // 取得 AppDelegate
            // 針對 Restaurant Entity 建立託管物件
            restaurant = NSEntityDescription.insertNewObjectForEntityForName("Restaurant", inManagedObjectContext: managedObjectContext) as! Restaurant
            
            restaurant.name         = name!
            restaurant.type         = type!
            restaurant.location     = location!
            restaurant.isVisited    = isVisited
            if let restaurantImage = imageView.image {
                // 以 PNG 格式取得圖像
                restaurant.image = UIImagePNGRepresentation(restaurantImage)
            }
            
            // 儲存
            do {
                try managedObjectContext.save()
            }catch{
                print(error)
                return
            }
            
        }
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        // Dismiss the view controller
        dismissViewControllerAnimated(true, completion: nil)
    }
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





