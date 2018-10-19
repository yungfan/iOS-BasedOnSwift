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
     *  plist对应的字典 必须借助于NSDictionary 因为Swift的Dictionary没有提供读文件的初始化函数
     */
    var cityNames:NSDictionary?
    /**
     *  省份
     */
    var provinces:[String] = [String]()
    /**
     *  城市
     */
    var cities:[String] = [String]()
    /**
     *  选中的省份
     */
    var selectedProvince:String = ""
    
    //UIPickerViewDataSource
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if component == 0 {
            
            return self.provinces.count
        }
            
        else {
            
            //通过所选省份 获取对应的城市
            self.cities = (self.cityNames?[selectedProvince] as? [String])!
            
            return self.cities.count
        }
    }
    
    
    
    //UIPickerViewDelegate
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if component == 0 {
            
            return self.provinces[row]
        }
            
        else{
            
            //通过所选省份 获取对应的城市
            self.cities = (self.cityNames?[selectedProvince] as? [String])!
            
            return self.cities[row]
        }
        
    }
    
    //选择的数据列
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        
        //选择第一列的时候
        if component == 0 {
            
            //获取用户选择的省份
            self.selectedProvince = self.provinces[row]
            
            //重新加载第二列数据
            pickerView.reloadComponent(1)
            
            //让第二列数据滚动到第一行
            pickerView.selectRow(0, inComponent: 1, animated: true)
            
            
        }
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //读取plist文件
        if let path = Bundle.main.path(forResource: "cityData", ofType: "plist"){
            
            //将plist文件转成字典
            self.cityNames = NSDictionary(contentsOfFile: path)
            
            //获取所有的省份
            self.provinces = (cityNames?.allKeys as! [String])
            
            //默认选择第一个省份
            self.selectedProvince = self.provinces.first!
            
        }
        
        
       
    }
    
    
}


