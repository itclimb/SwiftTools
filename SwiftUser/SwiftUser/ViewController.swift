//
//  ViewController.swift
//  SwiftUser
//
//  Created by itclimb on 2017/9/19.
//  Copyright © 2017年 itclimb.yuancheng.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
    @IBAction func saveData(_ sender: Any) {
        let data: [String: String] = [
            "userName":"swift",
            "userMobile":"123",
            "userId":"8",
            "userNick":"clean",
            "userAge":"4"
        ]
        JINUser.instance.Name = data["userName"]
        JINUser.instance.Age = data["userAge"]
        JINUser.instance.Id = data["userId"]
        JINUser.instance.Nick = data["userNick"]
        JINUser.instance.Mobile = data["userMobile"]
    }
    
    @IBAction func getData(_ sender: Any) {
        let userName = JINUser.instance.Name
        let userMobile = JINUser.instance.Mobile
        let userId = JINUser.instance.Id
        let userNick = JINUser.instance.Nick
        let userAge = JINUser.instance.Age
        
        print("userName:\(String(describing: userName)),\(String(describing: userMobile)),\(String(describing: userId)),\(String(describing: userNick)),\(String(describing: userAge))")
    }
}

