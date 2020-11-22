//
//  LoginViewController.swift
//  SnapKit使用
//
//  Created by 杨帆 on 2019/3/1.
//  Copyright © 2019 杨帆. All rights reserved.
//

import SnapKit
import UIKit

class LoginViewController: UIViewController {
    var userTF: UITextField! // 用户名
    var pwdTF: UITextField! // 密码
    var backgroundView: UIView! // 背景
    var horizontalLine: UIView! // 分隔线
    var loginBtn: UIButton! // 登录
    var titleLLb: UILabel! // 标题

    var topConstraint: Constraint? // 登录框距顶部距离约束

    var originOffset = 50 // backgroundView开始的偏移
    var originHeight = 100 // backgroundView的高度

    override func viewDidLoad() {
        super.viewDidLoad()

        setBackgroundView()
        setHorizontalLine()
        setTitleLLb()
        setLoginBtn()
        setUserTF()
        setPwdTF()
    }

    // 所有布局 参考BackgroundView 所以要记住它的顶部约束 以便做键盘弹起的布局
    func setBackgroundView() {
        // 输入框背景
        backgroundView = UIView()
        backgroundView.backgroundColor = UIColor.white
        backgroundView.layer.cornerRadius = 10
        view.addSubview(backgroundView)

        // 设置约束
        backgroundView.snp.makeConstraints { (make) -> Void in
            make.left.equalTo(20)
            make.right.equalTo(-20)
            self.topConstraint = make.centerY.equalTo(self.view).offset(-originOffset).constraint
            // 背景高
            make.height.equalTo(originHeight)
        }
    }

    func setHorizontalLine() {
        // 分隔线
        horizontalLine = UIView()
        horizontalLine.backgroundColor = UIColor.lightGray
        backgroundView.addSubview(horizontalLine)

        horizontalLine.snp.makeConstraints { (make) -> Void in
            make.height.equalTo(0.5)
            make.left.equalTo(10)
            make.right.equalTo(-10)
            make.centerY.equalTo(self.backgroundView)
        }
    }

    func setTitleLLb() {
        // 分隔线
        titleLLb = UILabel()
        titleLLb.text = "Please Login"
        titleLLb.textColor = UIColor.white
        titleLLb.font = UIFont.systemFont(ofSize: 40)
        view.addSubview(titleLLb)

        titleLLb.snp.makeConstraints { (make) -> Void in
            make.bottom.equalTo(self.backgroundView.snp.top).offset(-20)
            make.centerX.equalTo(self.backgroundView)
        }
    }

    func setLoginBtn() {
        // 分隔线
        loginBtn = UIButton(type: .system)
        loginBtn.setTitle("登录", for: .normal)
        loginBtn.setTitleColor(UIColor.white, for: .normal)
        loginBtn.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        loginBtn.backgroundColor = UIColor.purple
        loginBtn.layer.cornerRadius = 5
        loginBtn.addTarget(self, action: #selector(login),
                           for: .touchUpInside)
        view.addSubview(loginBtn)

        loginBtn.snp.makeConstraints { (make) -> Void in

            make.width.equalTo(self.backgroundView)
            make.height.equalTo(44)
            make.left.equalTo(20)
            make.right.equalTo(-20)
            make.top.equalTo(self.backgroundView.snp.bottom).offset(20)
        }
    }

    func setUserTF() {
        // 分隔线
        userTF = UITextField()
        userTF.placeholder = "用户名"
        userTF.delegate = self
        backgroundView.addSubview(userTF)

        userTF.snp.makeConstraints { (make) -> Void in

            make.height.equalTo(44)
            make.left.equalTo(20)
            make.right.equalTo(-20)
            // 应该在背景的1/4处
            make.centerY.equalTo(self.backgroundView).offset(-originHeight / 4)
        }
    }

    func setPwdTF() {
        // 分隔线
        pwdTF = UITextField()
        pwdTF.placeholder = "密码"
        pwdTF.isSecureTextEntry = true
        pwdTF.delegate = self
        backgroundView.addSubview(pwdTF)

        pwdTF.snp.makeConstraints { (make) -> Void in

            make.height.left.right.equalTo(self.userTF)
            // 应该在背景的3/4处
            make.centerY.equalTo(self.backgroundView).offset(originHeight / 4)
        }
    }

    // 登录按钮点击
    @objc func login() {
        view.endEditing(true)
        // 约束恢复
        UIView.animate(withDuration: 0.5, animations: { () -> Void in

            // 这里需要注意 由于一开始偏离了50，所以这里需要偏离
            self.topConstraint?.update(offset: -self.originOffset)
            self.view.layoutIfNeeded()
        })
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        // 约束恢复
        UIView.animate(withDuration: 0.5, animations: { () -> Void in

            self.topConstraint?.update(offset: -self.originOffset)
            self.view.layoutIfNeeded()
        })
    }
}

extension LoginViewController: UITextFieldDelegate {
    // 输入框获取焦点
    func textFieldDidBeginEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.5, animations: { () -> Void in
            // 更新约束
            // 这里需要注意 由于一开始偏移了50，所以这里虽然偏移100 实际只移动了50
            self.topConstraint?.update(offset: -self.originOffset * 2)
            self.view.layoutIfNeeded()
        })
    }
}
