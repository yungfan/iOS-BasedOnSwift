//
//  ViewController.swift
//  ThirdFrameworkUsage
//
//  Created by 杨帆 on 2019/12/30.
//  Copyright © 2019 杨帆. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    fileprivate let titles = ["轮播器类","指示器类","图片类","图表类","播放器类"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}



extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.titles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "third", for: indexPath)
        cell.textLabel?.text = self.titles[indexPath.row]
        
        return cell
    }
    
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.row {
        case 0:
            
            self.navigationController?.pushViewController(FSPagerViewViewController(), animated: true)
            
        case 1:
            self.navigationController?.pushViewController(XLPagerTabStripViewController(), animated: true)
        case 2:
            self.navigationController?.pushViewController(DKImagePickerControllerViewController(), animated: true)
        case 3:
            self.navigationController?.pushViewController(ChartsViewController(), animated: true)
        case 4:
            self.navigationController?.pushViewController(BMPlayerViewController(), animated: true)
            
        default:
            print("error")
        }
        
    }
}
