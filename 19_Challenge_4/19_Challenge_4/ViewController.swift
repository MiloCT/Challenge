//
//  ViewController.swift
//  19_Challenge_4
//
//  Created by Milo on 2019/7/20.
//  Copyright © 2019 MUB. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let fullScren = UIScreen.main.bounds.size
    let mySlider = UISlider()
    let myLabel = UILabel()
    let bottonLabel = UILabel()
    let sale:Float = 10000.0
    var disCount:Float = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mySlider.frame = CGRect(x: 0, y: 0, width: fullScren.width * 0.9, height: 50)
        mySlider.center = CGPoint(x: fullScren.width * 0.5, y: fullScren.height * 0.6)
        mySlider.maximumTrackTintColor = UIColor.orange
        mySlider.minimumTrackTintColor = UIColor.purple
        mySlider.thumbTintColor = UIColor.blue
        mySlider.minimumValue = 0.01
        mySlider.maximumValue = 1
        mySlider.value = 1
        mySlider.isContinuous = true
        mySlider.addTarget(self, action: #selector(ViewController.changeValue), for: .valueChanged)
        self.view.addSubview(mySlider)
        
        myLabel.frame = CGRect(x: 0, y: 0, width: fullScren.width * 0.9, height: fullScren.height * 0.3)
        myLabel.center = CGPoint(x: fullScren.width * 0.5, y: fullScren.height * 0.3)
        myLabel.textColor = UIColor.black
        myLabel.font = myLabel.font.withSize(36)
        myLabel.textAlignment = .center
        myLabel.text = "商品價格：\(sale)"
        self.view.addSubview(myLabel)
        
        bottonLabel.frame = CGRect(x: 0, y: 0, width: fullScren.width * 0.9, height: fullScren.height * 0.3)
        bottonLabel.center = CGPoint(x: fullScren.width * 0.5, y: fullScren.height * 0.7)
        bottonLabel.textColor = UIColor.black
        bottonLabel.font = myLabel.font.withSize(36)
        bottonLabel.textAlignment = .center
        bottonLabel.text = "原價"
        self.view.addSubview(bottonLabel)
    }
    
    @objc func changeValue(){
        disCount = sale * Float(CGFloat(mySlider.value / mySlider.maximumValue))
        let temp = Int(disCount)
        myLabel.text = "商品價格：\(String(temp))"
        if mySlider.value == 1.00{
            bottonLabel.text = "原價"
        }
        else{
        bottonLabel.text = "折數：\(String(format: "%.2f", mySlider.value))"
        }
    }
}

