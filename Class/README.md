# Class
## 继承
1. 从已经设定好的内容开始设计
2. Protocol继承：从已定义的规范中继续增加，可同时继承多个
3. Class继承：直接使用继承对象的所有定义，只能继承一个
4. 被继承的对象：super
5. 继承的对象：sub
## override
1. 覆盖super定义的内容，可以覆盖任何方法和属性
2. 不能修改已宣告的类型
3. 如果父类属性能被set，覆盖后的属性也必须能被set
4. 可以替属性添加观察
## super
1. 表示super class
2. 只有在子类中可使用，用来调用父类的属性或方法
## final
1. 在属性或方法前面加上final，表示这个定义不能被覆盖
2. 直接加在整个类型宣告前方表示此类型不能被继承

## Class&启动
1. Class的启动过程
* 通过启动，把类型的每一个属性都赋值的过程
* 类型被启动后才能够开始通过self存取自己的属性和方法
* 通过定义不同参数类型或引数名称，建立多个init
* struct提供自动启动，class没有
* Class启动包括启动自己（自己定义的属性，非继承）和启动super

2. Designated、Convenient启动
```swift
// Designated init：启动自己定义的属性 》 启动super 》 修改继承的属性
// Convenience init：必须先调用另一个自己的启动，并且启动的调用最终一定要连到一个Designated init


// 自动启动继承
// Designated init：
// 1. 不能有任何自定义的Designated init
// 2. 没有新的属性或者新的属性有预设值

// Convenience
// 1. 有所有super的designated init（来自继承或自己设定都可以，只要参数、引数设定都相同）
class Rect {
    var width: Double 
    var height: Double

    init(width: Double, height: Double) {
        self.width = width
        self.height = height
    }

    convenience init(sideLength: Double) {
        self.init(width: sideLength, height: sideLength)
    }
}

class RectB {
     var high: Double = 3
}

let designated = RectB(width: 1, height: 2)
let convenience = RectB(sideLength: 2)
```
3. 关键字：required
```swift
// 1. 加在启动之前，表示所有继承的类型一定要设计这个启动
// 2. 子类设计required的启动时不需要写override，但也一样要标明required，因为后续的子类也需要设计此方法
```

4. 比较
```swift
// a == b
// a != b
// 1. 比较值Value
// 2. 根据Equatable判断是否相等
// 3. 任何Equatable的类型

// a === b
// a !== b
// 1. 比较身份Identity
// 2. 比较是否指向同一个位置
// 3. 必须是Reference Type
```
5. Struct和Class的不同
```swift
// struct：value type
// 不可继承
// 1. 有自动产生的启动方式
// 2. 需要mutating关键字改动

// class：reference type      ---- AnyObject
// 可以继承
// 1. 可用 === 比较是否指向同一个实例
// 2. 可设定deinit、convenience init
// 3. 可以在属性中用自己的类型
// 4. 可以搭配O-C使用
// 5. 可以用作type casting判断类别

```

6. Struct Or Class
```swift
// 1. 偏好使用struct
// 2. 需要一个可以在整个程序中被存取、修改的物件 - class
// 3. 需要搭配O-C使用 - class
// 4. 尝试使用protocol + extension处理继承
```