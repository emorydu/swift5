# KeyPath
1. 不需要实例就能表示属性位置&类型
2. 解释在一个资料中，哪个位置有什么类型的东西
```swift
struct Cat {
    var name: String
}

let cats = [Cat(name: "tomcat"), Cat(name: "tom")]
print(cats.map(\.name))
```
## KeyPath组成
1. \ + 类型名称（Root） + . + 属性名称（Value）
2. KeyPath
3. WritableKeyPath
4. ReferenceWritableKeyPath
5. PartialKeyPath
6. AnyKeyPath
7. 使用下标存取object[keyPath: path]
```swift
let cat = Cat(name: "tomcat")
cat.name == cat[keyPath: \.name]
```

## KeyPath + Protocol
```swift
protocol HasName {
    var name: String { get }
}

extension HasName {
    func sayHello() {
        print("hello, \(name)")
    }
}

struct Cat: HasName {
    let name: String
}

struct Address: HasName {
    let name: String
    let city: String    
    let street: String
}

// keypath
protocol HasName {
    static var namePath: KeyPath<Self, String> { get }
}
extension HasName {
    func sayHello() {
        print("Hello \(self[keyPath: Self.namePath])")
    }
}

struct Cat: HasName {
    static let namePath = \Cat.name
    let name: String
}

struct Address: HasName {
    static let namePath = \Address.households
    let households: String
    var city: String
    var street: String
}

```