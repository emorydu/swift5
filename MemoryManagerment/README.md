# Memory Managerment
1. Value Type & Reference Type
```swift
// Value Type
// 1. struct, enum, tuple, int, string, array ...

// Reference Type
// 1. class, closure, actor
```
2. ARC记忆体管理
```swift
// ARC管理连接数量

// 1. 在reference type的变量前面加上unowned / weak表示这个连结不该被计算
// 预设：强连结+1
// unowned：弱连接+0（实例本身和连结对象需要同时存在，可以是Optinal）
// weak：弱连接+0（实例本身可以独立存在，一定是Optional）

// 案例建议：
// 1. 如果想要确保不报错宕掉，weak是最安全的选择
// 2. 错误的状态是否宁可宕掉
// 3. 开发期测试使用unowned
```
3. 循环引用 Retain Cycles
```swift
// 1. Retain Cycle / Reference Cycle: 循环引用
// 2. ARC关键字：unowned & weak
class Cat {
    var name: String
    var friend: Cat?

    init(_ name: String) { self.name = name }

    deinit {
        print("Cat: \(name) deinit...")
    }
}

var tomcat: Cat? = Cat("tomcat")
var tom: Cat? = Cat("tom")

tom?.friend = tomcat    // !!
tomcat?.friend = tom    // !!

print(">> \(tomcat!.name) = nil")
tomcat = nil

print(">> \(tom!.name) = nil")
tom = nil 
print("finish")
```
4. 弱连接 weak & unowned
```swift
// Unowned
// 1. 实例本身和这个属性指向的目标应该要同时存在
// 2. 如果尝试存取的目标没有值（被释放了）就会报错
// 3. Unowned Optional，是在当属性设定为.some但是实际指向的目标已不存在时报错
```