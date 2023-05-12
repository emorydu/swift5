# Closure
## Closure类型写法
1. （参数类型）-> 返回值
2. Closure可以被设定为参数类型、可以被当做引数传递，可以被当做返回值类型
3. 这个类型的写法其实代表的是Closure
## 什么是Closure
1. 一段可以被传递的code
2. Closure可以被分为三种
Function：具有名字
Nested Function：具有名字，可以capturing
Closure Expressions：没有名字，可以capturing
```swift
// nested function
func sayHello(_ person: String) {
    func say() {
        print("hello, \(person)")
    }
    let emorydu = Bool.random()
    if emorydu {
        say()
        return
    }
    print("hi, \(person)")
}

// Closure Expressions
func min(a: Int, b: Int) -> Int {
    a < b ? a : b
}

// 
{ (a: Int, b Int) -> Int in     // in表示宣告类型结束   ，参数不能具有预设值， 没有引数名称，使用closure时一律写值，因为没有引数名称，如果类型是可以接受多个引数的（T...），在后面不能再放其他参数
    a < b ? a : b
}

// Closure的用处
// 1. closure语法可以存在变量中
// 2. 主要用在设定引数时，直接写简短的closure语法
let minClosure = { (a: Int, b: Int, c: Int...) -> Int in 
    a < b ? a : b
}
minClosure(2, 5)
```

## Other Function
```swift

```
 