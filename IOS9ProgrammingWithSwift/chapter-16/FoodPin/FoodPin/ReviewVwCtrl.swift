//
//  ReviewVwCtrl.swift
//  FoodPin
//
//  Created by dah.com on 2016/1/23.
//  Copyright © 2016年 Jason. All rights reserved.
//

import UIKit

class ReviewVwCtrl: UIViewController {

    @IBOutlet weak var backgroundImgView: UIImageView!
    @IBOutlet weak var ratingStackView  : UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // 背景加入模糊效果
        let blurEffect      = UIBlurEffect(style: .Dark)
        let blurEffectView  = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.frame
        backgroundImgView.addSubview(blurEffectView)
        
        // 堆疊視圖加入動畫
        ratingStackView.transform = CGAffineTransformMakeScale(0.0, 0.0)
        
    }

    func ratingAnimation(){
         // CGAffineTransformIdentity 儲存正常尺寸的數值，把此數值指派給堆疊視圖
         self.ratingStackView.transform = CGAffineTransformIdentity
    }
    
    // 視圖顯示完成後會呼叫此方法
    override func viewDidAppear(animated: Bool) {
        // 0.2 表示整個動畫持續的時間
        UIView.animateWithDuration(0.2, delay: 0.0, options: [], animations: ratingAnimation, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
