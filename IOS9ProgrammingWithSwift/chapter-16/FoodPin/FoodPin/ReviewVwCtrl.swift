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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let blurEffect      = UIBlurEffect(style: .Dark)
        let blurEffectView  = UIVisualEffectView(effect: blurEffect)
        
        blurEffectView.frame = view.frame
        backgroundImgView.addSubview(blurEffectView)
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
