//
//  ViewController.swift
//  UITableView索引
//
//  Created by 杨帆 on 2018/10/29.
//  Copyright © 2018 ABC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var sectionTitles:[String]  = ["A","C","F","G","H","M","S","T","X","Z"]
    var contentsArray: [[String]]  = [
        ["阿伟","阿姨","阿三"],
        ["蔡芯","成龙","陈鑫","陈丹","成名"],
        ["芳仔","房祖名","方大同","芳芳","范伟"],
        ["郭靖","郭美美","过儿","过山车"],
        ["何仙姑","和珅","郝歌","好人"],
        ["妈妈","毛不易"],
        ["孙周","沈冰","婶婶"],
        ["涛涛","淘宝","套娃"],
        ["小二","夏紫薇","许巍","许晴"],
        ["周扒皮","周杰伦","张柏芝","张大仙"]
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.tableView.sectionIndexBackgroundColor = UIColor.red
    }


}

extension ViewController : UITableViewDataSource{
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return self.sectionTitles.count
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.contentsArray[section].count
    
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "abc")
        
        cell?.textLabel?.text = self.contentsArray[indexPath.section][indexPath.row]
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return self.sectionTitles[section]
    }
}

extension ViewController : UITableViewDelegate{
    
    //索引的标题
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        
         return self.sectionTitles
    }
    
    
    //点击索引
    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        
        //点击的索引标题
        print(title)
        
        //一定要返回index 否则 点击索引不会自动滚动到指定位置
        return index
    }
    
}

