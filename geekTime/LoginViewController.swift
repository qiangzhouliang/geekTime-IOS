//
//  LoginViewController.swift
//  geekTime
//
//  Created by qiangzhouliang on 2020/12/6.
//

import UIKit
import SnapKit

protocol ValidatesPhoneNumber {
    func validatePhoneNumber(_ phoneNumber: String) -> Bool
}

protocol ValidatesPassword {
    func validatePassword(_ phonePassword: String) -> Bool
}

extension ValidatesPhoneNumber {
    func validatePhoneNumber(_ phoneNumber: String) -> Bool {
        if phoneNumber.count != 11 {
            return false
        }
        return true
    }
}

extension ValidatesPassword {
    func validatePassword(_ phonePassword: String) -> Bool {
        if phonePassword.count < 6 || phonePassword.count > 12{
            return false
        }
        return true
    }
}

class LoginViewController: BaseViewController,ValidatesPhoneNumber,ValidatesPassword {

    //两个输入框
    var phoneTextField: UITextField!
    var passwordTextField: UITextField!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //设置logo
        let logoView = UIImageView(image: R.image.logo())
        view.addSubview(logoView)
        logoView.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(30)
            //显示在水平线的中间
            make.centerX.equalToSuperview()
        }
        
        //设置电话号码输入框
        let phoneIconView = UIImageView(image: R.image.icon_phone())
        phoneTextField = UITextField()
        //设置左边的布局
        phoneTextField.leftView = phoneIconView
        phoneTextField.leftViewMode = .always //总是显示在左边
        //设置边框样式
        phoneTextField.layer.borderColor = UIColor.hexColor(0x333333).cgColor
        phoneTextField.layer.borderWidth = 1
        //设置文本颜色
        phoneTextField.textColor = UIColor.hexColor(0x333333)
        
        //设置圆角
        phoneTextField.layer.cornerRadius = 5
        phoneTextField.layer.masksToBounds = true
        //设置占位符
        phoneTextField.placeholder = "请输入电话号码"
        //添加到view
        view.addSubview(phoneTextField)
        
        //编写布局
        phoneTextField.snp.makeConstraints{ make in
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            //设置在logo的下面
            make.top.equalTo(logoView.snp_bottomMargin).offset(20)
            //设置高度
            make.height.equalTo(50)
        }
        
        //设置密码框
        let passwordIconView = UIImageView(image: R.image.icon_pwd())
        passwordTextField = UITextField()
        passwordTextField.leftView = passwordIconView
        passwordTextField.leftViewMode = .always //总是显示在左边
        //设置边框样式
        passwordTextField.layer.borderColor = UIColor.hexColor(0x333333).cgColor
        passwordTextField.layer.borderWidth = 1
        //设置文本颜色
        passwordTextField.textColor = UIColor.hexColor(0x333333)
        
        //设置圆角
        passwordTextField.layer.cornerRadius = 5
        passwordTextField.layer.masksToBounds = true
        //设置占位符
        passwordTextField.placeholder = "请输入密码"
        passwordTextField.isSecureTextEntry = true //表示密码输入
        //添加到view
        view.addSubview(passwordTextField)
        
        //编写布局
        passwordTextField.snp.makeConstraints{ make in
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            //设置在logo的下面
            make.top.equalTo(phoneTextField.snp_bottomMargin).offset(15)
            //设置高度
            make.height.equalTo(50)
        }
        
        //登录按钮
        let loginButton = UIButton(type: .custom)
        loginButton.setTitle("登录", for: .normal)
        loginButton.setTitleColor(.white, for: .normal)
        //设置字体大小
        loginButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        //设置点击高亮
        loginButton.setBackgroundImage(UIColor.hexColor(0xf8892e).toImage(), for: .normal)
        //设置圆角
        loginButton.layer.cornerRadius = 5
        loginButton.layer.masksToBounds = true
        
        
        view.addSubview(loginButton)
        //设置位置
        loginButton.snp.makeConstraints{ make in
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.top.equalTo(passwordTextField.snp_bottomMargin).offset(20)
            make.height.equalTo(50)
        }
        
        loginButton.addTarget(self, action: #selector(didClickLoginButton), for: .touchUpInside)
    }
    
    @objc func didClickLoginButton() {
        if validatePhoneNumber(phoneTextField.text ?? "") && validatePassword(passwordTextField.text ?? "") {
            
        } else {
            self.showToast()
        }
    }
    
    //弹出提示框
    func showToast() {
        let alertVC = UIAlertController(title: "提示", message: "用户名或者密码错误", preferredStyle: .alert)
        present(alertVC, animated: true, completion: nil)
        //一定时间后消失
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2, execute: {
            alertVC.dismiss(animated: true, completion: nil)
        })
    }
}
