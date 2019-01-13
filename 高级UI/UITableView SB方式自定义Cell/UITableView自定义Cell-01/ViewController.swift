//
//  ViewController.swift
//  UITableView自定义Cell-01
//
//  Created by 杨帆 on 2018/11/5.
//  Copyright © 2018 ABC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var pics = ["add_friend_icon_addgroup_36x36_","Contact_icon_ContactTag_36x36_","plugins_FriendNotify_36x36_","Plugins_WeSport_36x36_","ReadVerified_icon_36x36_"]
    
    var titles = ["小龙女哀悼金庸", "坠江公交黑匣子","新iPad发布","金庸去世", "苹果发布会"]
    
    var times = ["10:12", "10:15", "10:20", "10:50", "11:00"]
    
    var contents = ["小龙女哀悼金庸:他笔下的小龙女给予我一切一切", "重庆坠江公交车黑匣子打捞出水 已交公安部门", "新iPad发布 苹果10月发布会发布三款新品", "94岁金庸去世 网友明星悼念:他带着武侠梦睡着了", "苹果于10月30号晚上22点召开新品发布会"]

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.tableView.rowHeight = 100.0
    }


}

extension ViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pics.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell : WechatTableViewCell = tableView.dequeueReusableCell(withIdentifier: "abc") as! WechatTableViewCell;
        
        let wechat :WeChat = WeChat(picImage: self.pics[indexPath.row], titleText: self.titles[indexPath.row], timeText: self.times[indexPath.row], contentText: self.contents[indexPath.row])
        
        cell.wechat = wechat
        
        cell.configUI()
        
        return cell
        
    }
    
    
    
}

