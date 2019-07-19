//
//  ViewController.swift
//  19_Challenge_1
//
//  Created by Milo on 2019/7/19.
//  Copyright © 2019 MUB. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let mySwitch = UISwitch()
    let myLabel = UILabel()
    let fullScreenSize = UIScreen.main.bounds.size

    override func viewDidLoad() {
        super.viewDidLoad()
        
        mySwitch.center = CGPoint(x: fullScreenSize.width * 0.5, y: fullScreenSize.height * 0.75)
        self.view.addSubview(mySwitch)
        
        myLabel.frame = CGRect(x: 0, y: 0, width: 65, height:  65)
        myLabel.center = CGPoint(x: fullScreenSize.width * 0.5, y: fullScreenSize.height * 0.5)
        myLabel.backgroundColor = UIColor.white
        self.view.addSubview(myLabel)
        
        mySwitch.addTarget(self , action: #selector(ViewController.onChange), for: .touchUpInside)
        
        self.onChange(sender: UISwitch())
        
    }

    @objc func onChange(sender:AnyObject){
        
        let tempSwitch = sender as! UISwitch
        
        if tempSwitch.isOn{
            self.view.backgroundColor = UIColor.white
            myLabel.backgroundColor = UIColor.black
        }
        else{
            self.view.backgroundColor = UIColor.black
            myLabel.backgroundColor = UIColor.white
        }
        
    }
    
}

