//
//  ViewController.swift
//  KVC转模型
//
//  Created by 杨帆 on 2019/3/27.
//  Copyright © 2019 杨帆. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //从Bundle读取JSON
        let path = Bundle.main.path(forResource: "data", ofType: "json")
        
        let url = URL(fileURLWithPath: path!)
        
        let data = try? Data(contentsOf: url)
        
        if let data = data {
            
            //JSON转[String:Any]
            let data =  try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String:Any]
            
            //调用KVC转模型
            let weather = Weather(dic: data)
            
            print(weather)
            
        }
    }


}

