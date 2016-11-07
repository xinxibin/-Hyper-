//
//  ImageBrowserImageView.swift
//  Hyper 图片轮播
//
//  Created by Xinxibin on 16/11/4.
//  Copyright © 2016年 Xinxibin. All rights reserved.
//

import UIKit

class ImageBrowserImageView: UIImageView {
    
    var bgView = UIView()
    var imageView1:UIImageView!
    
    var imgArr:[UIImage] = []
    var index = 0
    var dpLink:CADisplayLink?
    var transition:CATransition?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.red
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setBackgroundView()
        setImageView()
    }
    
    func setData(dataArr:[UIImage]) {
        imgArr = dataArr
        setDefaultImageView()
        setTimer()
    }
    
    func setBackgroundView() {
        
        bgView.frame = self.bounds
        bgView.backgroundColor = UIColor.white
        self.addSubview(bgView)
    }
    
    func setImageView() {
        
        imageView1 = UIImageView(frame: self.bounds)
        bgView.addSubview(imageView1)
        
    }
    
    func setDefaultImageView() {
            
        imageView1.image = imgArr[0]
    }
    
    func setTimer() {
        
        let time = arc4random()%120 + 80
        stopTimer()

        dpLink = CADisplayLink(target: self, selector: #selector(self.runTimer))
        dpLink?.frameInterval = Int(time)
        dpLink?.isPaused = false
        dpLink?.add(to: RunLoop.current, forMode: RunLoopMode.commonModes)
        
    }
    
    func stopTimer() {
        
        if self.dpLink != nil {
            self.dpLink?.invalidate()
        }
    }
    
    func stopTransiTion() {
        transition = nil
    }
    
    func runTimer() {
        
        self.imageView1.alpha = 0
        UIView.animate(withDuration: 1, animations: {
            self.imageView1.alpha = 1
        }, completion: nil)
        
        stopTransiTion()
        transition = CATransition()
        transition?.duration = 1
        transition?.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        transition?.type = kCATransitionFade
        self.bgView.layer.add(transition!, forKey: "a")
        
        if index >= imgArr.count - 1 {
            index = 0
        }else {
            index += 1
        }
        self.imageView1.image = imgArr[index]

    }
}
