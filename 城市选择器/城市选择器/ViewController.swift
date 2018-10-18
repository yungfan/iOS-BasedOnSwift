//
//  ViewController.swift
//  城市选择器
//
//  Created by 杨帆 on 2018/10/17.
//  Copyright © 2018 ABC. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    
    
    /**
     *  plist对应的字典
     */
    var cityNames:NSDictionary?
    /**
     *  省份
     */
    var province:[String]?
    /**
     *  城市
     */
    var city:[String]?
    /**
     *  选中的省份
     */
    var selectedProvince:String?
    
    //UIPickerViewDataSource
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if component == 0 {
            
            return self.province!.count
        }
            
        else {
            
            self.city = self.cityNames?[self.selectedProvince!] as? [String]
            
            return self.city!.count
        }
    }
    
    
    
    //UIPickerViewDelegate
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if component == 0 {
            
            return self.province![row]
        }
            
        else{
            
            self.city = (self.cityNames?.value(forKey: self.selectedProvince!) as! [String])
            
            return self.city![row]
        }
        
    }
    
    //选择的数据列
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        
        
        if component == 0 {
            
            self.selectedProvince = self.province?[row]
            
            pickerView.reloadComponent(1)
            
            pickerView.selectRow(0, inComponent: 1, animated: true)
            
            
        }
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if let path = Bundle.main.path(forResource: "cityData", ofType: "plist"){
            
             self.cityNames = NSDictionary(contentsOfFile: path)
            
            self.province = (cityNames?.allKeys as! [String])
            
            self.selectedProvince = province?.first
            
        }
        
        
       
    }
    
    
}


