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
//        label.backgroundColor = UIColor.lightGray
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
    
    @objc func signIn(){
        let mypassword = "Milo"
        let alertController = UIAlertController(
            title: "登入",
            message: "請輸入帳號與密碼",
            preferredStyle: .alert)
        
        // 建立兩個輸入框
        alertController.addTextField {
            (textField: UITextField!) -> Void in
            textField.placeholder = "帳號"
        }
        alertController.addTextField {
            (textField: UITextField!) -> Void in
            textField.placeholder = "密碼"
            // 如果要將textField顯示為密碼樣式，那這個屬性要設定為 true
            textField.isSecureTextEntry = true
        }
        
        // 建立[取消]按鈕
        let cancelAction = UIAlertAction(
            title: "取消",
            style: .cancel,
            handler: nil)
        alertController.addAction(cancelAction)
        
        // 建立[登入]按鈕
        let okAction = UIAlertAction(
            title: "登入",
            style: .default) {
                (action: UIAlertAction!) -> Void in
                let acc = (alertController.textFields?.first)! as UITextField
                let password = (alertController.textFields?.last)! as UITextField
                let temp = String(password.text!)
                
                if acc.text!.isEmpty || password.text!.isEmpty{
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
                print("輸入的帳號為：\(acc.text!)")
                print("輸入的密碼為：\(password.text!)")
        }
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
}

