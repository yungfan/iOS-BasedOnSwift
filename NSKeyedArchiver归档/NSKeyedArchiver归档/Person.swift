//
//  Person.swift
//  NSKeyedArchiver归档
//
//  Created by 杨帆 on 2018/12/14.
//  Copyright © 2018 ABC. All rights reserved.
//

import UIKit

class Person: NSObject, NSSecureCoding {
    static var supportsSecureCoding: Bool = true
    
    
    //编码-序列化调用
    func encode(with aCoder: NSCoder) {
        
        aCoder.encode(age, forKey: "age")
        aCoder.encode(name, forKey: "name")
        
        print("encode")
    }
    
    //解码-反序列化调用
    required init?(coder aDecoder: NSCoder) {
        
        super.init()
        
        age = aDecoder.decodeObject(forKey: "age") as? Int
        name = aDecoder.decodeObject(forKey: "name") as? String
        
        print("decode")
        
    }
    
    
    var name:String?
    var age:Int?
    
    override init() {
        
    }

}
