# Optional
1. 一个只有两种可能的enum：<T> 和 nil
```swift
let nubmer:Int? = Optional<Int>.none
let nubmer2: Int? = Int?.some(5)
let nubmer3: Int? = nil
let number4: Int? = 9

let array = [nubmer, nubmer2, nubmer3, number4]
for number in array {
    switch number {
    case .none:
        print("<nil>")
    case .some(let wrapped):
        print(wrapped)
    }
}
```
## 解开Optional
1. 一定要一个不是nil的值的时候
2. ! 强制解开
3. ?? 预设值
```swift
// let someNumber: Int? = nil
let someNumber: Int? = 100
// let wrappedSomeNumber: Int = someNumber! //  Fatal error: Unexpectedly found nil while unwrapping an Optional value
// print(wrappedSomeNumber)s

let defaultValue: Int = someNumber ?? 0
print(defaultValue)
```
## Optional Binding
1. 只在有值的时候做处理
2. if let: 假如可以成功赋值的话就...
3. guard let: 必须成功赋值才能继续
```swift
let something: String? = nil
switch something {
case .some(let string):
    print("\(string)")
case .none:
    break
}

if case Optional<String>.some(let string) = something {
    print("\(string).")
}


let name: String? = "emorydu"
if let name = name {
    print("hello, \(name).")
}

func greeting(_ name: String?) {
    guard let name = name else {
        return
    }

    print("Hello, \(name).")
}
greeting("lin")
greeting(nil)
```
## Optional Chaining
1. ?.
2. 有值才继续往下存取属性/方法
```swift
struct Profile {
    let name: String
    let phone: String?
}

let profile: Profile? = .init(name: "Emory", phone: "328384278")

if let profile = profile, let phone = profile.phone {
    print(phone)
}

print(profile?.phone)
```
