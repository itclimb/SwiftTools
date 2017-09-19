//
//  JINUser.swift
//  SwiftTools
//
//  Created by itclimb on 2017/8/21.
//  Copyright © 2017年 itclimb.yuancheng.com. All rights reserved.
//

import UIKit

class JINUser: NSObject {
    static let instance = JINUser()
    private override init() {
        Name = UserDefaults.user.name.stringValue ?? ""
        Age = UserDefaults.user.age.stringValue ?? ""
    }

    var Name: String?{
        didSet{
            UserDefaults.user.name.store(value: Name)
        }
    }
    
    var Age: String?{
        didSet{
            UserDefaults.user.age.store(value: Age)
        }
    }
    
    
}
