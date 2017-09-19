//
//  UserDefaults_Extension.swift
//  SwiftTools
//
//  Created by itclimb on 2017/8/21.
//  Copyright © 2017年 itclimb.yuancheng.com. All rights reserved.
//

import UIKit

extension UserDefaults {

    enum user: String,UserDefaultsProtocol {
        case name
        case age
    }
}

public protocol UserDefaultsProtocol {
    
    var uniqueKey: String{get}
}

extension UserDefaultsProtocol where Self:RawRepresentable,Self.RawValue == String{
    
    ///Any类型
    func store(value: Any?) {
        UserDefaults.standard.setValue(value, forKey: uniqueKey)
    }
    var value: Any? {
        return UserDefaults.standard.value(forKey: uniqueKey)
    }
    var stringValue: String? {
        return value as? String
    }
    
    ///URL类型
    func store(url: URL?) {
        UserDefaults.standard.set(url, forKey: uniqueKey)
    }
    var urlValue: URL? {
        return UserDefaults.standard.url(forKey: uniqueKey)
    }
    
    ///BOOL类型
    func store(value: Bool) {
        UserDefaults.standard.set(value, forKey: uniqueKey)
    }
    var boolValue: Bool {
        return UserDefaults.standard.bool(forKey: uniqueKey)
    }
    
    //设置唯一的key
    var uniqueKey: String {
        return"\(Self.self).\(rawValue)"
    }
    //Delete
    func remove() {
        UserDefaults.standard.removeObject(forKey: uniqueKey)
    }
}
