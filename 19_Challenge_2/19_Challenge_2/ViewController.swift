//
//  ViewController.swift
//  19_Challenge_2
//
//  Created by Milo on 2019/7/19.
//  Copyright © 2019 MUB. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var fullScreen = UIScreen.main.bounds.size
    let myButton = UIButton()
    let myLabel1 = UILabel()
    let myLabel2 = UILabel()
    let myLabel3 = UILabel()
    let myArr1 = [0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 610, 987, 1597, 2584, 4181, 6765, 10946, 17711, 28657, 46368, 75025, 121393, 196418, 317811, 514229, 832040, 1346269, 2178309, 3524578, 5702887, 9227465, 14930352, 24157817, 39088169, 63245986, 102334155]
    let myArr2 = [1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 610, 987, 1597, 2584, 4181, 6765, 10946, 17711, 28657, 46368, 75025, 121393, 196418, 317811, 514229, 832040, 1346269, 2178309, 3524578, 5702887, 9227465, 14930352, 24157817, 39088169, 63245986, 102334155]
    var numbers1 = 0
    var numbers2 = 0
    var numbers3 = 0
    var temp1 = 0
    var temp2 = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myButton.frame = CGRect(x: 0, y: 0, width: 100, height: 70)
        myButton.center = CGPoint(x: fullScreen.width * 0.5, y: fullScreen.height * 0.6)
        myButton.setTitle("Touch me", for: .normal)
        myButton.backgroundColor = UIColor.lightGray
        self.view.addSubview(myButton)
        
        myLabel1.frame = CGRect(x: 0, y: 0, width: fullScreen.width * 1, height: fullScreen.height * 0.15)
        myLabel1.center = CGPoint(x: fullScreen.width * 0.5, y: fullScreen.height * 0.15)
        myLabel1.backgroundColor = UIColor.lightGray
        myLabel1.font = myLabel1.font.withSize(36)
        myLabel1.textAlignment = .center
        self.view.addSubview(myLabel1)
        
        myLabel2.frame = CGRect(x: 0, y: 0, width: fullScreen.width * 1, height: fullScreen.height * 0.15)
        myLabel2.center = CGPoint(x: fullScreen.width * 0.5, y: fullScreen.height * 0.3)
        myLabel2.backgroundColor = UIColor.lightGray
        myLabel2.font = myLabel2.font.withSize(36)
        myLabel2.textAlignment = .center
        self.view.addSubview(myLabel2)
        
        myLabel3.frame = CGRect(x: 0, y: 0, width: fullScreen.width * 1, height: fullScreen.height * 0.15)
        myLabel3.center = CGPoint(x: fullScreen.width * 0.5, y: fullScreen.height * 0.45)
        myLabel3.backgroundColor = UIColor.lightGray
        myLabel3.font = myLabel3.font.withSize(36)
        myLabel3.textAlignment = .center
        self.view.addSubview(myLabel3)
        
        myButton.addTarget(self, action: #selector(ViewController.doMath), for: .touchUpInside)
        
    }
    
    @objc func doMath(sender:UIButton){
        temp1 = myArr1[numbers1]
        temp2 = myArr2[numbers2]
        numbers1 += 1
        numbers2 += 1
        numbers3 = temp1 + temp2
        myLabel1.text = String(temp1)
        myLabel2.text = String(temp2)
        myLabel3.text = String(numbers3)
        //        for (index1, index2) in myArr1.enumerated(){
        //            print(index1,index2)
        //        }
    }
}

