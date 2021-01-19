//
//  ViewController.swift
//  UIViewPropertyAnimator动画
//
//  Created by 杨帆 on 2021/1/19.
//

import UIKit

class ViewController: UIViewController {
    let redView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))

    var animator: UIViewPropertyAnimator!

    override func viewDidLoad() {
        super.viewDidLoad()

        redView.backgroundColor = .red
        view.addSubview(redView)

        animator = UIViewPropertyAnimator(duration: 2.0, curve: .linear) {
            self.redView.center = self.view.center
        }
    }

    @IBAction func reverse(_ sender: Any) {
        animator.isReversed = true
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        animator.startAnimation()
    }
}
