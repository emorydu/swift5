# Struct
1. Struct是一种ValueType
2. Struct具有静态空间和实例空间
3. 在这些空间里像平常一样建立变量（属性）和function（方法），但是它们需要通过对应的空间存取
4. 主要用来包装资料和整理code
5. 可以conforms to protocol
```swift
// 建立struct
// 1. 通过struct关键字宣告
// 2. 惯用大驼峰命名
// 3. 在后面打括号内的区域定义
struct Dog {

}


// 设定属性
// 1. 在类型内建立的变数是实例的属性，只能通过实例存取
// 2. 在实例被建立之前并不存在，所以不需要预先赋值
// 3. 使用let建立的就不能修改
struct Dog {
    var name: String
    var age = 0
    let kind: String
}

var dog = Dog(name: "Jerry", age: 8, kind: "dog")
dog.name = "yep"
// dog.kind = "cat" // compile error


// 设定方法
// 1. 在类型内建立的function是实例的方法，只能通过实例存取
// 2. 可以直接存取实例的属性
// 3. 如果要从方法修改属性，需要标记方法是mutating
struct Dog {
    var name: String
    var age = 0
    var kind: String

    func called() {
        print("\(name): Woof~~~~")
    }

    mutating func changeName(to name: String) {
        self.name = name
    }
}

// 设定静态属性&方法
// 1. 在方法和属性前面加上static就变成静态的
// 2. 静态不需要实例，它属于类型本身，也就是程序一启动就存在了
// 3. 可以直接存取自己的静态属性
struct Dog {
    static let scientificName = "Canis lupus familiaris"
    static let boomerang = Dog(scientificName: "None", kind: "Boomerang")

    static func print() {
        print("\(scientificName), is my friends")
    }
}

// 类型里的Self & self
// 1. self表示自己，通常会省略
// 2. Self表示自己的类型

// 预设启动方式
// 1. Struct会自动根据预设的资料建立启动方式，用属性名称作为引数名词
// 2. 可以省略已经有预设值的属性
struct Dog {
    var name: String
    var age = 0
    var kind: String
}

var d = Dog(name: "SunnyGao", kind:"🐶")
var d = Dog(name: "SunnyGao", age: 38, kind:"🦮")

// 自定义启动方式
// 1. 可以通过init自己定义启动方式，写法和function一样
// 2. 必须在init的block之中赋值给所有没有预设值、不是Optional的属性
// 3. init是mutating的
// 4. 自己定义init后不回保留自动产生的启动器
struct Dog {
    var name: String
    var age = 0
    var kind: String

    init(_ name: String, kind: String) {
        self.name = name
        self.kind = kind
    }
}

// 私有属性
// 1. 在属性前加上private，这个属性就不能从外部存取
// 2. private属性无法产生预设启动，需要自己编写init，或是用let设定固定的预设值
// 3. 属性可以被get和set
// 4. 设定写入的部分私有，让外部依然能存取，但是不能修改 
struct Dog {
    var name: String
    private var age = 0
    // private(set) var age = 0
    let kind: String
}

// dog.age  // compile error

// conforms to protocol
// 1. 在定义类型名称的后面加上冒号和想加入的Protocol
// 2. 用逗号区分多个Protocol
// 3. 需要在struct的定义中加入规范的属性或方法
struct Dog: Hashable {
    func hash(into hasher: inout Hasher) {
        // code
    }
}
```