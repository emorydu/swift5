# Properties
## 计算属性介绍
1. 之前使用的属性都是Stored Property，可以通过存取得到值
2. 计算属性是经过运算所得到值
3. 不需要参数的方法都可以变成计算属性，获得更好的阅读性
4. 每次存取都会重新运算，不适合放入太复杂的、繁重的code 


```swift
struct Product {
    let originalPrice: Double = 100.0
    var discount = 0.8

    func computeCurrentPrice() -> Double {
        originalPrice * discount
    }
}

// 计算属性使用
// 1. 必须使用var宣告
// 2. 不可省略类型
// 3. 至少需要能够get
// 4. 如果要让这个属性可以修改，需要设定set方法
// 5. set预设的参数名称是newValue，也可以自定义名称
struct Product {
    let originalPrice: Double = 199.9
    var discount = 0.8

    var currentPrice: Double {
        get { originalPrice * discount }
        set { discount = newValue / originalPrice }
    }
}

// 何时使用计算属性
// 1. 能够调用的时候阅读性更好、更合理并且运算过程简单的时候
```
## 属性观察
1. 用来通知值的变化，就算新的值相同也会触发
2. 与存储属性或者继承的计算属性搭配使用（因为自己的计算属性可以使用set/get）
```swift
struct Product {
    let originalPrice = 100.0
    var discount = 0.8 {
        willSet {   // 即将改变时通知
            print("\(newValue)")
        }
        didSet {    // 改变发生后通知
            print("\(oldValue) -> \(discount)")
        }
    }
    var price: Double { get { originalPrice * discount } }
}
// 何时使用属性观察器
// 1. 需要在改变前后做一些事情
// 2. 很多地方都可能改变这属性，不用在每个地方都写一次前后流程
// 3. 需要的处理运算过程简单

// 两种动态属性设定比较
struct Product {
    let originalPrice = 100.0
    var discount = 0.8

    var currentPrice: Double { originalPrice * discount }   // currentPrice运算次数取决于这个属性调用次数
}

// 多一个存储price的空间
// price运算次数取决于discount改变次数
struct Product {
    let originalPrice = 100.0
    var discount = 0.8 {
        didSet {
            originalPrice * discount
        }
    }

    private(set) var price: Double = 80
}


// 提供动态的初始值
struct Product {
    let originalPrice: Double
    var discount: Double {
        didSet {
            price = original * discount
        }
    }
    private(set) var price: Double 

    init(originalPrice: Double, discount: Double) {
        self.originalPrice = originalPrice
        self.discount = discount
        self.price = price * discount
    }
}

struct Product {
    let originalPrice: Double 
    var discount: Double {
        didSet {
            price = originalPrice * discount
        }
    }

    lazy private(set) var price: Double = originalPrice * discount
}
```