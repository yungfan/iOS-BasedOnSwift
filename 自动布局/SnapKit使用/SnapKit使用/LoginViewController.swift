//
//  LoginViewController.swift
//  SnapKit使用
//
//  Created by 杨帆 on 2019/3/1.
//  Copyright © 2019 杨帆. All rights reserved.
//

import UIKit
import SnapKit

class LoginViewController: UIViewController {
    
    var userTF: UITextField! //用户名
    var pwdTF: UITextField! //密码
    var backgroundView: UIView! //背景
    var horizontalLine: UIView! //分隔线
    var loginBtn:UIButton! //登录
    var titleLLb: UILabel! //标题
    
    var topConstraint: Constraint? //登录框距顶部距离约束
    
    var originOffset = 50 //backgroundView开始的偏移
    var originHeight = 100 //backgroundView的高度

    override func viewDidLoad() {
        super.viewDidLoad()

        setBackgroundView()
        setHorizontalLine()
        setTitleLLb()
        setLoginBtn()
        setUserTF()
        setPwdTF()
    }
    
    //所有布局 参考BackgroundView 所以要记住它的顶部约束 以便做键盘弹起的布局
    func setBackgroundView(){
        
        //输入框背景
        self.backgroundView = UIView()
        self.backgroundView.backgroundColor = UIColor.white
        self.backgroundView.layer.cornerRadius = 10
        self.view.addSubview(self.backgroundView)
        
        //设置约束
        self.backgroundView.snp.makeConstraints { (make) -> Void in
            make.left.equalTo(20)
            make.right.equalTo(-20)
            self.topConstraint =  make.centerY.equalTo(self.view).offset(-originOffset).constraint
            //背景高
            make.height.equalTo(originHeight)
        }
        
    }
    
    func setHorizontalLine(){
        
        //分隔线
        self.horizontalLine =  UIView()
        self.horizontalLine.backgroundColor = UIColor.lightGray
        self.backgroundView.addSubview(self.horizontalLine)
        
        self.horizontalLine.snp.makeConstraints { (make) -> Void in
            make.height.equalTo(0.5)
            make.left.equalTo(10)
            make.right.equalTo(-10)
            make.centerY.equalTo(self.backgroundView)
            
        }
        
    }
    
    func setTitleLLb(){
        
        //分隔线
        self.titleLLb =  UILabel()
        self.titleLLb.text = "Please Login"
        self.titleLLb.textColor = UIColor.white
        self.titleLLb.font = UIFont.systemFont(ofSize: 40)
        self.view.addSubview(self.titleLLb)
       
        self.titleLLb.snp.makeConstraints { (make) -> Void in
            make.bottom.equalTo(self.backgroundView.snp.top).offset(-20)
            make.centerX.equalTo(self.backgroundView)
            
        }
        
    }
    
    func setLoginBtn(){
        
        //分隔线
        self.loginBtn =  UIButton(type: .system)
        self.loginBtn.setTitle("登录", for: .normal)
        self.loginBtn.setTitleColor(UIColor.white, for: .normal)
        self.loginBtn.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        self.loginBtn.backgroundColor = UIColor.purple
        self.loginBtn.layer.cornerRadius = 5
        self.loginBtn.addTarget(self, action: #selector(login),
                                     for: .touchUpInside)
        self.view.addSubview(self.loginBtn)
        
        self.loginBtn.snp.makeConstraints { (make) -> Void in
            
            make.width.equalTo(self.backgroundView)
            make.height.equalTo(44)
            make.left.equalTo(20)
            make.right.equalTo(-20)
            make.top.equalTo(self.backgroundView.snp.bottom).offset(20)
            
        }
        
    }
    
    
    func setUserTF(){
        
        //分隔线
        self.userTF =  UITextField()
        self.userTF.placeholder = "用户名"
        self.userTF.delegate = self
        self.backgroundView.addSubview(self.userTF)
        
        self.userTF.snp.makeConstraints { (make) -> Void in
            
            make.height.equalTo(44)
            make.left.equalTo(20)
            make.right.equalTo(-20)
            //应该在背景的1/4处
            make.centerY.equalTo(self.backgroundView).offset(-originHeight/4)
        }
        
    }
    
    func setPwdTF(){
        
        //分隔线
        self.pwdTF =  UITextField()
        self.pwdTF.placeholder = "密码"
        self.pwdTF.isSecureTextEntry = true
        self.pwdTF.delegate = self
        self.backgroundView.addSubview(self.pwdTF)
        
        self.pwdTF.snp.makeConstraints { (make) -> Void in
            
            make.height.left.right.equalTo(self.userTF)
            //应该在背景的3/4处
            make.centerY.equalTo(self.backgroundView).offset(originHeight / 4)
        }
        
    }


    
    //登录按钮点击
    @objc func login(){

        self.view.endEditing(true)
        //约束恢复
        UIView.animate(withDuration: 0.5, animations: { () -> Void in
            
            //这里需要注意 由于一开始便宜了50，所以这里需要便宜
            self.topConstraint?.update(offset: -self.originOffset)
            self.view.layoutIfNeeded()
        })
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.view.endEditing(true)
        //约束恢复
        UIView.animate(withDuration: 0.5, animations: { () -> Void in
            
            self.topConstraint?.update(offset: -self.originOffset)
            self.view.layoutIfNeeded()
        })
    }

}


extension LoginViewController :UITextFieldDelegate {
    
    //输入框获取焦点
    func textFieldDidBeginEditing(_ textField:UITextField){
        
        UIView.animate(withDuration: 0.5, animations: { () -> Void in
            //更新约束
            //这里需要注意 由于一开始偏移了50，所以这里虽然偏移100 实际只移动了50
            self.topConstraint?.update(offset: -self.originOffset * 2)
            self.view.layoutIfNeeded()
        })
    }
}


