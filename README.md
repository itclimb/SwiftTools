# SwiftTools
swift中用户信息管理文件
* Nice个人信息存储

首先,给UserDefaults扩展需要存储的个人信息枚举变量,注意这个枚举遵循一个自定义协议,协议是该存储的关键部分.
```
extension UserDefaults {

    enum user: String,UserDefaultsProtocol {
        case name
        case age
        case nick
        case mobile
        case id
    }
}
```
协议中定义一个变量uniqueKey给需要存储的值设置唯一的key,并提供存储和取值的方法.
```
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

```
在user管理类中通过协议中提供的方法方便的进行存取,使开发更加便捷.
```
class JINUser: NSObject {
    static let instance = JINUser()
    private override init() {
        Name = UserDefaults.user.name.stringValue ?? ""
        Age = UserDefaults.user.age.stringValue ?? ""
        Nick = UserDefaults.user.nick.stringValue ?? ""
        Id = UserDefaults.user.id.stringValue ?? ""
        Mobile = UserDefaults.user.mobile.stringValue ?? ""
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
    
    var Nick: String?{
        didSet{
            UserDefaults.user.nick.store(value: Nick)
        }
    }
    
    var Id: String?{
        didSet{
            UserDefaults.user.id.store(value: Id)
        }
    }
    
    var Mobile: String?{
        didSet{
            UserDefaults.user.mobile.store(value: Mobile)
        }
    }
  
}
```
