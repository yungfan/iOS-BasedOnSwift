//
//  ViewController.swift
//  UIPickerView案例
//
//  Created by 杨帆 on 2018/10/17.
//  Copyright © 2018 ABC. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    
    let province:[String] = ["安徽", "浙江", "江苏", "山东", "河南", "湖北"]
    
    let city:[String] = ["合肥", "杭州", "南京", "济南", "郑州", "武汉", "厦门", "长沙"]
    
    //UIPickerViewDataSource
    //返回选择器的列数
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if component == 0 {
            
            return self.province.count
        }
        
        else {
        
            return self.city.count
       }
    }
    
    
    
    //UIPickerViewDelegate
    //该方法会调用多次 根据numberOfRowsInComponent的返回值决定
    //每一次调用就应该返回一个数据 它会自动从第0行开始设置title
    //6行 0 1 2 3 4 5
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if component == 0 {
            
            return self.province[row]
        }
            
        else{
            
            return self.city[row]
        }
       
    }

    //选择的数据列
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
       
        
        if component == 0 {
            
            print(self.province[row])
            
        }
            
        else{
            
            print(self.city[row])
        }
        
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

