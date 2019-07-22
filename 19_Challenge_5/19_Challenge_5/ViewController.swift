//
//  ViewController.swift
//  19_Challenge_5
//
//  Created by Milo on 2019/7/19.
//  Copyright © 2019 MUB. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {
    
    let fullScrenn = UIScreen.main.bounds.size
    let login = UIButton()
    let label = UILabel()
    var okAction: UIAlertAction! = nil
    var acc = UITextField()
    var password = UITextField()
    var alertController:UIAlertController!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        login.frame = CGRect(x: 0, y: 0, width: 120, height: 30)
        login.center = CGPoint(x: fullScrenn.width * 0.5, y: fullScrenn.height * 0.5)
        login.setTitle("登入", for: .normal)
        login.setTitleColor(.blue, for: .normal)
        login.backgroundColor = UIColor.init(red: 0.9, green: 0.9, blue: 0.9, alpha: 1)
        self.view.addSubview(login)
        
        label.frame = CGRect(x: 0, y: 0, width: fullScrenn.width * 0.9, height: 100)
        label.center = CGPoint(x: fullScrenn.width * 0.5, y: fullScrenn.height * 0.3)
        label.font = label.font.withSize(20)
        label.textAlignment = .center
        self.view.addSubview(label)
        
        login.addTarget(self, action: #selector(ViewController.signIn), for: .touchUpInside)
        }
    
    //點擊retrun收起鍵盤
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    
    //點擊空白觸收起鍵盤
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    //當帳號密碼都輸入時才可以按登入鈕
    @objc func textFieldIsEmpty(){
        let textField0: UITextField  = alertController.textFields![0]
        let textField1: UITextField  = alertController.textFields![1]
        alertController.actions[1].isEnabled = !textField0.text!.isEmpty && !textField1.text!.isEmpty
    }
    
    
    @objc func signIn(){
        let mypassword = "Milo"
        alertController = UIAlertController(
            title: "登入",
            message: "請輸入帳號與密碼",
            preferredStyle: .alert)
        
        // 建立兩個輸入框
        alertController.addTextField {
            (textField: UITextField!) -> Void in
            textField.placeholder = "帳號"
            textField.addTarget(self, action: #selector(ViewController.textFieldIsEmpty), for: .editingChanged)
        }
        alertController.addTextField {
            (textField: UITextField!) -> Void in
            textField.placeholder = "密碼"
            // 如果要將textField顯示為密碼樣式，那這個屬性要設定為 true
            textField.isSecureTextEntry = true
            textField.addTarget(self, action: #selector(ViewController.textFieldIsEmpty), for: .editingChanged)
        }
        
        // 建立[取消]按鈕
        let cancelAction = UIAlertAction(
            title: "取消",
            style: .cancel,
            handler: nil)
        alertController.addAction(cancelAction)
        
        // 建立[登入]按鈕
        okAction = UIAlertAction(
            title: "登入",
            style: .default)
            {
                (action: UIAlertAction!) -> Void in
                self.acc = (self.alertController.textFields?.first)! as UITextField
                self.password = (self.alertController.textFields?.last)! as UITextField
                let temp = String(self.password.text!)
                if self.acc.text!.isEmpty || self.password.text!.isEmpty{
                   self.label.text = "請輸入完整的帳號及密碼缺一不可"
                }
                else if temp == mypassword {
                    self.label.textColor = .blue
                    self.label.text = "密碼正確"
                }
                else{
                    self.label.textColor = .red
                    self.label.text = "密碼錯誤"
                }
                print("輸入的帳號為：\(self.acc.text!)")
                print("輸入的密碼為：\(self.password.text!)")
        }
        okAction.isEnabled = false
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
}

