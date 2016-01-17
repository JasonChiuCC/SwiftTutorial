//
//  ViewController.swift
//  ConcurrencyDemo
//
//  Created by Hossam Ghareeb on 11/15/15.
//  Copyright © 2015 Hossam Ghareeb. All rights reserved.
//

import UIKit

let imageURLs = ["http://www.planetware.com/photos-large/F/france-paris-eiffel-tower.jpg",
                 "http://adriatic-lines.com/wp-content/uploads/2015/04/canal-of-Venice.jpg",
                 "http://algoos.com/wp-content/uploads/2015/08/ireland-02.jpg",
                 "http://bdo.se/wp-content/uploads/2014/01/Stockholm1.jpg"]

// 建立 Operation 隊列
var queue = NSOperationQueue()

class Downloader {
    class func downloadImageWithURL(url:String) -> UIImage! {
        let data = NSData(contentsOfURL: NSURL(string: url)!)
        return UIImage(data: data!)
    }
}

class ViewController: UIViewController {

    @IBOutlet weak var imageView1: UIImageView!
    
    @IBOutlet weak var imageView2: UIImageView!
    
    @IBOutlet weak var imageView3: UIImageView!
    
    @IBOutlet weak var imageView4: UIImageView!
    
    @IBOutlet weak var sliderValueLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func didClickOnStart(sender: AnyObject) {
        
#if false
// 使用並行隊列（下載）+串行隊列（更新UI）
        // dispatch_get_global_queue 取得 Default 優先權的[並行隊列]
        let queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
        dispatch_async(queue) { () -> Void in
            let img1 = Downloader.downloadImageWithURL(imageURLs[0])
            
            // dispatch_get_main_queue 取得[串列隊列]並更新 UI 畫面
            dispatch_async(dispatch_get_main_queue(), {
                self.imageView1.image = img1
            })
        }
        
        dispatch_async(queue) { () -> Void in
            let img2 = Downloader.downloadImageWithURL(imageURLs[1])
            dispatch_async(dispatch_get_main_queue(), {
                
                self.imageView2.image = img2
            })
        }
        
        dispatch_async(queue) { () -> Void in
            let img3 = Downloader.downloadImageWithURL(imageURLs[2])
            dispatch_async(dispatch_get_main_queue(), {
                
                self.imageView3.image = img3
            })
        }
        
        dispatch_async(queue) { () -> Void in
            let img4 = Downloader.downloadImageWithURL(imageURLs[3])
            dispatch_async(dispatch_get_main_queue(), {
                self.imageView4.image = img4
            })
        }
#endif
        
#if false
// 使用新建串行隊列（下載）+ 原始串行隊列（更新UI）
    
        // 建立新的串行隊列
        let serialQueue = dispatch_queue_create("com.appcoda.imagesQueue", DISPATCH_QUEUE_SERIAL)

        dispatch_async(serialQueue) { () -> Void in
            let img1 = Downloader .downloadImageWithURL(imageURLs[0])
            // 使用原始的串行隊列更新UI
            dispatch_async(dispatch_get_main_queue(), {
                self.imageView1.image = img1
            })
        }

        dispatch_async(serialQueue) { () -> Void in
            let img2 = Downloader.downloadImageWithURL(imageURLs[1])
            dispatch_async(dispatch_get_main_queue(), {
                
                self.imageView2.image = img2
            })
        }

        dispatch_async(serialQueue) { () -> Void in
            let img3 = Downloader.downloadImageWithURL(imageURLs[2])
            dispatch_async(dispatch_get_main_queue(), {
                
                self.imageView3.image = img3
            })
        }

        dispatch_async(serialQueue) { () -> Void in
            let img4 = Downloader.downloadImageWithURL(imageURLs[3])
            dispatch_async(dispatch_get_main_queue(), {
                self.imageView4.image = img4
            })
        }
#endif
        
#if true
// 使用 Operation 隊列
    
    // 使用 addOperationWithBlock 指定的一個閉包來創建一個新的 Operation 實例
    queue.addOperationWithBlock { () -> Void in
        let img1 = Downloader.downloadImageWithURL(imageURLs[0])
        
        // NSOperationQueue.mainQueue() 代替 GCD 中的 dispatch_async() 方法來獲取主隊列
        NSOperationQueue.mainQueue().addOperationWithBlock({
            self.imageView1.image = img1
        })
    }
    
    queue.addOperationWithBlock { () -> Void in
        let img2 = Downloader.downloadImageWithURL(imageURLs[1])
        NSOperationQueue.mainQueue().addOperationWithBlock({
            self.imageView2.image = img2
        })
    }
    
    queue.addOperationWithBlock { () -> Void in
        let img3 = Downloader.downloadImageWithURL(imageURLs[2])
        NSOperationQueue.mainQueue().addOperationWithBlock({
            self.imageView3.image = img3
        })
    }
    
    queue.addOperationWithBlock { () -> Void in
        let img4 = Downloader.downloadImageWithURL(imageURLs[3])
        NSOperationQueue.mainQueue().addOperationWithBlock({
            self.imageView4.image = img4
        })
    }
#endif
    }
    
    @IBAction func sliderValueChanged(sender: UISlider) {
        
        self.sliderValueLabel.text = "\(sender.value * 100.0)"
    }

}

