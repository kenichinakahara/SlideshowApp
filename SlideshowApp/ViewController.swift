//
//  ViewController.swift
//  SlideshowApp
//
//  Created by kenic on 2016/08/02.
//  Copyright © 2016年 kenic. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //画像
    @IBOutlet weak var imageView: UIImageView!
    let photos = ["001.jpg", "002.jpg", "003.jpg", "004.jpg", "005.jpg"]
    var index: Int = 0
    
    //スライドショー
    var slideshowFlag: Bool = false
    let slideshowInterval: NSTimeInterval = 2

    //タイマー
    var timer : NSTimer!
    
    //進むボタンとAction
    @IBOutlet weak var next: UIButton!
    @IBAction func next(sender: AnyObject) {
        
        index += 1
        
        if index > 4{
            
            index = 0
            imageView.image = UIImage(named: photos[index])
        }else{
            imageView.image = UIImage(named: photos[index])
        }

    }
    
    //戻るボタンとAction
    @IBOutlet weak var back: UIButton!
    @IBAction func back(sender: AnyObject) {
        
        index -= 1
        
        if index < 0{
            index = 4
            imageView.image = UIImage(named: photos[index])
            
        }else{
            imageView.image = UIImage(named: photos[index])
        }
    }
    
    //再生・停止ボタンとAction
    @IBOutlet weak var play: UIButton!
    @IBAction func play(sender: AnyObject) {

        //フラグ判定
        if slideshowFlag == false {
            
            //フラグON
            slideshowFlag = true
            
            //進む・戻るボタンのマスク
            next.enabled = false
            back.enabled = false
            
            //タイマー設定
            timer = NSTimer.scheduledTimerWithTimeInterval(slideshowInterval, target: self, selector: #selector(ViewController.onTimer(_:)), userInfo: nil, repeats: true)
            
            //ボタン変更
            play.setTitle("停止", forState: .Normal)
            
        }else{
            
            //フラグOFF
            slideshowFlag = false
            
            //進む・戻るボタンのマスク解除
            next.enabled = true
            back.enabled = true
            
            //タイマー無効化
            timer?.invalidate()
            
            //ボタン変更
            play.setTitle("再生", forState: .Normal)
        }
        
    }
    
    //画像タップ時の処理
    func imageTapped(img: AnyObject)
    {
        let storyboard: UIStoryboard = self.storyboard!
        let nextView = storyboard.instantiateViewControllerWithIdentifier("ImageViewController") as! ImageViewController
        nextView.photoName = photos[index]
        self.presentViewController(nextView, animated: true, completion: nil)
        
        //スライドショー解除
        slideshowFlag = false
        
        //進む・戻るボタンのマスク解除
        next.enabled = true
        back.enabled = true
        
        //タイマー無効化
        timer?.invalidate()
        
        //ボタン変更
        play.setTitle("再生", forState: .Normal)
        
    }
    
    /// NSTimerによる画像遷移処理
    func onTimer(timer: NSTimer) {
        
        index += 1
        
        if index > 4{
            
            index = 0
            imageView.image = UIImage(named: photos[index])
            
        }else{
            imageView.image = UIImage(named: photos[index])
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //初期画像はphotos[0]とする
        imageView.image = UIImage(named: photos[index])
        
        //画像タップ処理呼び出し
        imageView.userInteractionEnabled = true
        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(ViewController.imageTapped(_:))))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

