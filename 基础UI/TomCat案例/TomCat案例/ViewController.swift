//
//  ViewController.swift
//  TomCat案例
//
//  Created by 杨帆 on 2018/10/15.
//  Copyright © 2018 ABC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var imageArray:[UIImage] = [UIImage]()
    
    @IBOutlet weak var tomcat: UIImageView!
    
    @IBAction func drink(_ sender: Any) {
        
        self.imageArray.removeAll()
        
        var imgName = ""
        
        //1.加载drink的动画图片
        for index in 0...80 {
            
            //drink_XX.jpg
            
            if index < 10{
                
                 imgName = "drink_0\(index).jpg"
            }
            
            else{
                
                 imgName = "drink_\(index).jpg"
                
            }
           
            //通过名字构造一张图片
            let image = UIImage.init(named: imgName)
            
            imageArray.append(image!)
            
        }
        
        
        //2.让图片进行动画的播放
        //图片数组
        self.tomcat.animationImages = imageArray
        //动画时间
        self.tomcat.animationDuration = 3.0
        //动画次数
        self.tomcat.animationRepeatCount = 1
        //开始动画
        self.tomcat.startAnimating()
        
        
    }
    
    
    
    
    @IBAction func leftFootClick(_ sender: Any) {
        
        
        
        self.imageArray.removeAll()
        
        var imgName = ""
        
        //1.加载drink的动画图片
        for index in 0...29 {
            
            //drink_XX.jpg
            
            if index < 10{
                
                imgName = "footLeft_0\(index).jpg"
            }
                
            else{
                
                imgName = "footLeft_\(index).jpg"
                
            }
            
            //通过名字构造一张图片
            let image = UIImage.init(named: imgName)
            
            imageArray.append(image!)
            
        }
        
        
        //2.让图片进行动画的播放
        //图片数组
        self.tomcat.animationImages = imageArray
        //动画时间
        self.tomcat.animationDuration = 2.0
        //动画次数
        self.tomcat.animationRepeatCount = 1
        //开始动画
        self.tomcat.startAnimating()
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

}

