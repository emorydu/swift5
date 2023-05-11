# Type&Function
## 类型可以做什么
1. 建立变量时提供，让Swift知道它的大小，寻找合适的内存空间存储资料
2. 类型可以限制属性/方法
## 方法&函数
1. 方法不等同于函数
## Tuple类型
1. 由多种资料组成
2. 简单处理复合类型资料
3. 通过数字或名字存取个别数值
```swift
let fruit = ("Apple", 10)
print(fruit.0)
print(fruit.1)

let fruit = (name: "Apple", price: 10)
print(fruit.name)
print(fruit.price)
```
## typealias
1. 类型别名
## Function
1. 为一段code命名，方便重复使用
2. return后面接返回值，可以具有多个return
3. 设计时提供的参数名称，可以设定一些使用时才放入值的变量
```swift
func min(a: Int, b: Int) -> Int {
    return a < b ? a : b
}
print(min(3, 4))


// 引数名称和参数名称
// 1. 引数名称预设和参数名称一样
// 2. 可以使用下划线来省略引数名称
// 3. 只要引数名称、参数类型或回传值任何一个不同，就可以设定同样的变量名


// 可变长参数
func min(of numbers: Int...) -> Int {
    var min = numbers.first 
    for number in numbers {
        min = number < min ? number : min
    }

    return min
} 
min(of: 0)
min(of: 3, 0, 2, 4)
```


