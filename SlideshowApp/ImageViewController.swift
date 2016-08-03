//
//  ImageViewController.swift
//  SlideshowApp
//
//  Created by kenic on 2016/08/03.
//  Copyright © 2016年 kenic. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {
    
    //画像
    @IBOutlet weak var imageExpand: UIImageView!
    
    //戻るボタン
    @IBAction func back(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    var photoName : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let image1:UIImage! = UIImage(named: photoName)
        
        let h = image1.size.height
        let w = image1.size.width
        
        let image2: CGImage!
        image2 = CGImageCreateWithImageInRect(image1.CGImage, CGRectMake(w * 0.1, 0, w * 0.8, h * 0.8))
        
        let image3:UIImage! = UIImage(CGImage: image2)
        
        imageExpand.image = image3
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
