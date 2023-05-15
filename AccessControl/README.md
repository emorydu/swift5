# AccessControl
1. 表示一个类型、属性或方法可以被哪些地方存取
2. open：外部，Class才会有，被标记open，表示可以被外部继承，如果属性标记，表示可以被override
3. public：外部
4. internal：内部，预设的
5. fileprivate：同一个文件
6. private：同文件同类型
7. 最上层的private等同于fileprivate
```swift
private struct Food {   // private等同于fileprivate，表示Food类型同文件可以访问
    var name: String
}
```
## 类型的Access
1. 如果类型是fileprivate或private，这个access会直接套用到所有属性和方法
```swift
private struct Food {   // private等同于fileprivate，表示Food类型同文件可以访问
    var name: String    // 因为Food是private的，故此name属性也会是private
}
```
2. 如果是open或public，属性和方法就维持预设。（包括预设的启动）
```swift
public struct Food {   
    var name: String    // internal
}
```
## Extension的Access
1. 给extension设定access的话会直接套用进extension宣告的内容
```swift
public extension Food {
    func cook() {}  // public
}

private extension Food {
    func cook() {}  // private
}
```
## Extesion + Protocol
1. 如果extension用来搭配protocol就不能加上access宣告
```swift
extension Fodo: CustomStringConvertiable {
    var description: String { name }
}
```
## Protocol的Access
1. 只能对整个protocol设定access
2. 意思是至少要能满足这个access level
## 不能被更限制的类型定义
```swift
fileprivate func doSomething() -> FilePrivateType 

struct Food {
    fileprivate var something: FilePrivateType
}
```
## 从开放最少的开始设计
1. 有需要才开放更多
2. 使用时更简洁，不会看到多余的内容
3. 名字更好取
4. 更明确的分工、架构



