//
//  RedView.swift
//  触摸
//
//  Created by 杨帆 on 2019/1/19.
//  Copyright © 2019 ABC. All rights reserved.
//

import UIKit

class RedView: UIView {
    // SB、XIB中初始化的会调用下面的构造函数
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        // self.alpha = 0.000001

        // self.isUserInteractionEnabled = false

        isHidden = true
    }

    /**
        //找寻最合适的View的底层方法
        override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {

            return self
        }

        //判断触摸的点在不在范围内
        override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {

            return true
        }

     */

    // 四种触摸函数
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)

        print(#function)
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        print(#function)
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        print(#function)
    }

    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        print(#function)
    }
}
