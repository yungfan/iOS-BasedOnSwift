//
//  MyTableViewCell.swift
//  多Section处理
//
//  Created by 杨帆 on 2021/1/3.
//

import UIKit

class MyTableViewCell: UITableViewCell {
    @IBOutlet var myid: UILabel!
    @IBOutlet var thing: UILabel!
    @IBOutlet var money: UILabel!

    // 设置数据
    func setData(model: 明细) {
        myid.text = String(model.id)
        thing.text = model.事项
        money.text = String(model.金额)
    }
}
