//
//  ViewController.swift
//  19_Challenge_3
//
//  Created by Milo on 2019/7/19.
//  Copyright © 2019 MUB. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate{

    let fullScerrn = UIScreen.main.bounds.size
    let textFeildTop = UITextField()
    let textFeildBotton = UITextField()
    let textFeildHeight = UITextField()
    let labelTop = UILabel()
    let labelBotton = UILabel()
    let labelHeight = UILabel()
    let labelTotal = UILabel()
    let button = UIButton()
    var top: Int?
    var botton: Int?
    var height: Int?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        button.frame = CGRect(x: 0, y: 0, width:fullScerrn.width * 0.22, height: 80)
        button.center = CGPoint(x: fullScerrn.width * 0.89, y: fullScerrn.height * 0.55)
        button.setTitle("計算總和", for: .normal)
        button.backgroundColor = UIColor.blue
        self.view.addSubview(button)
        
        labelTop.frame = CGRect(x: 0, y: 0, width: fullScerrn.width * 0.5, height: 80)
        labelBotton.frame = CGRect(x: 0, y: 0, width: fullScerrn.width * 0.5, height: 80)
        labelHeight.frame = CGRect(x: 0, y: 0, width: fullScerrn.width * 0.5, height: 80)
        labelTotal.frame = CGRect(x: 0, y: 0, width: fullScerrn.width * 0.78, height: 80)
        labelTop.center = CGPoint(x: fullScerrn.width * 0.25, y: fullScerrn.height * 0.1)
        labelBotton.center = CGPoint(x: fullScerrn.width * 0.25, y: fullScerrn.height * 0.25)
        labelHeight.center = CGPoint(x: fullScerrn.width * 0.25, y: fullScerrn.height * 0.4)
        labelTotal.center = CGPoint(x: fullScerrn.width * 0.391, y: fullScerrn.height * 0.55)
        labelTop.backgroundColor = UIColor.lightGray
        labelBotton.backgroundColor = UIColor.lightGray
        labelHeight.backgroundColor = UIColor.lightGray
        labelTotal.backgroundColor = UIColor.lightGray
        labelTop.font = labelTop.font?.withSize(32)
        labelBotton.font = labelTop.font?.withSize(32)
        labelHeight.font = labelTop.font?.withSize(32)
        labelTotal.font = labelTop.font?.withSize(22)
        self.view.addSubview(labelTop)
        self.view.addSubview(labelBotton)
        self.view.addSubview(labelHeight)
        self.view.addSubview(labelTotal)
        
        textFeildTop.frame = CGRect(x: 0, y: 0, width: fullScerrn.width * 0.5, height: 80)
        textFeildBotton.frame = CGRect(x: 0, y: 0, width: fullScerrn.width * 0.5, height: 80)
        textFeildHeight.frame = CGRect(x: 0, y: 0, width: fullScerrn.width * 0.5, height: 80)
        textFeildTop.center = CGPoint(x: fullScerrn.width * 0.75, y: fullScerrn.height * 0.1)
        textFeildBotton.center = CGPoint(x: fullScerrn.width * 0.75, y: fullScerrn.height * 0.25)
        textFeildHeight.center = CGPoint(x: fullScerrn.width * 0.75, y: fullScerrn.height * 0.4)
        textFeildTop.backgroundColor = UIColor.yellow
        textFeildBotton.backgroundColor = UIColor.yellow
        textFeildHeight.backgroundColor = UIColor.yellow
        textFeildTop.textAlignment = .center
        textFeildBotton.textAlignment = .center
        textFeildHeight.textAlignment = .center
        textFeildTop.font = textFeildTop.font?.withSize(40)
        textFeildBotton.font = textFeildTop.font?.withSize(40)
        textFeildHeight.font = textFeildTop.font?.withSize(40)
        textFeildTop.delegate = self
        textFeildBotton.delegate = self
        textFeildHeight.delegate = self
        textFeildTop.keyboardType = .numberPad
        textFeildBotton.keyboardType = .numberPad
        textFeildHeight.keyboardType = .numberPad
        self.view.addSubview(textFeildTop)
        self.view.addSubview(textFeildBotton)
        self.view.addSubview(textFeildHeight)
        
        textFeildTop.addTarget(self, action: #selector(ViewController.setTop), for: .editingChanged)
        textFeildBotton.addTarget(self, action: #selector(ViewController.setBotton), for: .editingChanged)
        textFeildHeight.addTarget(self, action: #selector(ViewController.setHeight), for: .editingChanged)
        button.addTarget(self, action: #selector(ViewController.onChange), for: .touchUpInside)

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
    
    //避免鍵盤輸入非數字
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == textFeildTop {
            let allowedCharacters = CharacterSet(charactersIn:"+0123456789 ")
            let characterSet = CharacterSet(charactersIn: string)
            return allowedCharacters.isSuperset(of: characterSet)
        }
        if textField == textFeildBotton {
            let allowedCharacters = CharacterSet(charactersIn:"+0123456789 ")
            let characterSet = CharacterSet(charactersIn: string)
            return allowedCharacters.isSuperset(of: characterSet)
        }
        if textField == textFeildHeight {
            let allowedCharacters = CharacterSet(charactersIn:"+0123456789 ")
            let characterSet = CharacterSet(charactersIn: string)
            return allowedCharacters.isSuperset(of: characterSet)
        }
        return true
    }

    @objc func setTop(){
        labelTop.text = textFeildTop.text ?? ""
        labelTotal.text = "輸入的上底為:\(labelTop.text!)"
    }
    @objc func setBotton(){
        labelBotton.text = textFeildBotton.text ?? ""
        labelTotal.text = "輸入的下底為:\(labelBotton.text!)"

    }
    @objc func setHeight(){
        labelHeight.text = textFeildHeight.text ?? ""
        labelTotal.text = "輸入的高為:\(labelHeight.text!)"

    }
    
    @objc func onChange(){
//        if labelTop.text != nil{
//            top = Int(labelTop.text!)!
//            labelTop.text = "上底:\(top!)"
//        }
//        else{
//            labelTotal.text = "請輸入值"
//
//        }
//        if labelBotton.text != nil{
//        botton = Int(labelBotton.text!)!
//            labelBotton.text = "下底:\(botton!)"
//        }
//        else{
//            labelTotal.text = "請輸入值"
//
//        }
//        if labelHeight.text != nil{
//        height = Int(labelHeight.text!)!
//            labelHeight.text = "高:\(height!)"
//        }
//        else{
//            labelTotal.text = "麻煩請輸入上底下底及寬"
//        }
        if labelTop.text != nil,
            labelBotton.text != nil,
            labelHeight.text != nil{
            top = Int(labelTop.text!)!
            labelTop.text = "上底:\(top!)"
            botton = Int(labelBotton.text!)!
            labelBotton.text = "下底:\(botton!)"
            height = Int(labelHeight.text!)!
            labelHeight.text = "高:\(height!)"
        }
        if top != nil && botton != nil && height != nil{
        let plus = top! + botton!
        let areaX2 = height! * plus
        let area = areaX2 / 2
        labelTotal.text = "總和: \(String(area))"
        }
        else{
            labelTotal.text = "必須輸入上底下底及高才能計算"
        }
    }
}

