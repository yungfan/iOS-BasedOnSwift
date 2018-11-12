//
//  ViewController.swift
//  UICollectionView的使用
//
//  Created by 杨帆 on 2018/11/12.
//  Copyright © 2018 ABC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let layout = UICollectionViewFlowLayout()
        
        let screenW = UIScreen.main.bounds.size.width
        
        layout.itemSize = CGSize(width: (screenW - 15.0) * 0.5, height: 212)
        
        layout.minimumInteritemSpacing = 5.0
        
        layout.minimumLineSpacing = 5.0
        
        layout.sectionInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        
        layout.scrollDirection = .vertical
        
        self.collectionView.collectionViewLayout = layout
        
        self.collectionView

        
    }


}

extension ViewController : UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let cell = collectionView .dequeueReusableCell(withReuseIdentifier: "abc", for: indexPath)
        
        return cell
        
    }
    
    
    
}

extension ViewController : UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
        print("\(indexPath.row)")
        
    }
    
    

    
}

extension ViewController :UICollectionViewDelegateFlowLayout{
    
    
}

