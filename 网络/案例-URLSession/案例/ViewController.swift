//
//  ViewController.swift
//  案例
//
//  Created by 杨帆 on 2019/1/26.
//  Copyright © 2019 ABC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var newsTableView: UITableView!
    
    var data:[DataItem]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.newsTableView.dataSource = self
        
        self.newsTableView.delegate = self
        
        self.newsTableView.rowHeight = 110.0
        
        self.getNewsData()
    }
}

extension ViewController {
    
    func getNewsData() {
        
        let url = URL(string: "http://v.juhe.cn/toutiao/index?type=top&key=d1287290b45a69656de361382bc56dcd")
        
        let urlRequest = URLRequest(url: url!)
        
        
        let session = URLSession(configuration: URLSessionConfiguration.default)
        
        let task = session.dataTask(with: urlRequest) { (data, response, error) in
            
            
            let decoder = JSONDecoder()
            
            if let data = data {
                
                do {
                    
                    let newsModel = try decoder.decode(NewsModel.self, from: data)
                    
                    DispatchQueue.main.async {
                        
                        self.data = newsModel.result?.data
                        
                        self.newsTableView.reloadData()
                        
                    }
                }
                
                catch{
                    
                    print(error)
                    
                }
                
                
            }
           
        }
        
       task.resume()
    }
  
}


extension ViewController : UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let data = self.data {
            
            return data.count
        }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: NewsTableViewCell = tableView.dequeueReusableCell(withIdentifier: "news", for: indexPath) as! NewsTableViewCell
        
        let dataItem = self.data![indexPath.row]
        
        cell.setupCell(item: dataItem)
        
        return cell
    }
    
    
    
}

extension ViewController : UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let dataItem = self.data![indexPath.row]
        
        let detailsVC = DetailsViewController()
        
        detailsVC.selectedItem = dataItem
        
        self.navigationController?.pushViewController(detailsVC, animated: true)
        
    }
    
}
