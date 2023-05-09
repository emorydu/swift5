# Property Wrapper
1. 打包属性中的set、get、willSet、didSet资料，提供更简便的重复使用方法
 ```swift
 import Foundation

// example1
 struct Luggage {
    var weight: Int {
        didSet {
            weight = min(10, weight)
        }
    }

    init(weight: Int) {
        self.weight = min(10, weight)
    }
 }

 var packages = Luggage(weight: 5)
 print(packages)
 packages.weight = 13
 print(packages)
 packages.weight = 7



// example2
struct LimitMaximum {
    private(set) var maxValue: Int
    var value: Int {
        didSet{
            value = min(maxValue, value)
        }
    }

    init(maxValue: Int, value: Int) {
        self.maxValue = maxValue
        self.value = min(maxValue, value)
    }
}

struct Luggage {
    var weight: LimitMaximum
}

var packages = Luggage(weight: .init(maxValue: 12, value: 23))
print(packages.weight.value)
packages.weight.value = 2
print(packages.weight.value)
packages.weight.value = 999
print(packages.weight.value)

// example3
struct LimitMaximum {
    private(set) var maxValue: Int
    var value: Int {
        didSet{
            value = min(maxValue, value)
        }
    }

    init(maxValue: Int, value: Int) {
        self.maxValue = maxValue
        self.value = min(maxValue, value)
    }
}

struct Luggage {
    private(set) var _weight: LimitMaximum

    var weight: Int {
        get { _weight.value }
        set { _weight.value = newValue }
    }
}
var packages = Luggage(_weight: .init(maxValue: 10, value: 32))
print(packages.weight)
packages.weight = 1
print(packages.weight)


// example4
@propertyWrapper
struct LimitMaximum {
    private let maxValue: Int
    var wrappedValue: Int {
        didSet{
            wrappedValue = min(maxValue, wrappedValue)
        }
    }

    init(wrappedValue: Int, maxValue: Int) {
        self.wrappedValue = min(maxValue, wrappedValue)
        self.maxValue = maxValue
    }
}

struct Luggage {
    @LimitMaximum(maxValue: 10) var portableWeight: Int = 0
    @LimitMaximum(wrappedValue: 0, maxValue: 25) var checkedWeight: Int
    @LimitMaximum var golfEquipmentWeight: Int

    init(portableWeight: Int, checkedWeight: Int, maxCheckedWeight: Int, golfEquipmentWeight: Int) {
        self.portableWeight = portableWeight
        self._checkedWeight = .init(wrappedValue: checkedWeight, maxValue: maxCheckedWeight)
        self._golfEquipmentWeight = .init(wrappedValue: golfEquipmentWeight, maxValue: 30)
    }
}

var packages = Luggage(portableWeight: 15, checkedWeight: 25, maxCheckedWeight: 22, golfEquipmentWeight: 32)
print(packages.portableWeight)
print(packages.checkedWeight)
print(packages.golfEquipmentWeight)
 ```
 ## propertyWrapper写法
 1. 建立一个类型（enum、struct、class），并标示@propertyWrapper
 2. 必须有一个名为wrappedValue、至少可以get的属性（存储）
 3. 可以加上projectedValue投射任何属性或是本身
```swift
// example1
@propertyWrapper
struct ChangeLog<T> {
    var wrappedValue: T {
        didSet {
            print("📝\(description) ==> \(wrappedValue)")
        }
    }

    private(set) var description: String
}

struct Account {
    @ChangeLog(description: "Use") var use: String = ""
    @ChangeLog(description: "Spending") var spending: Int = 0
}

var spend = Account(use: "Macbook Air M2 purchase", spending: 15000)
print(spend.use, spend.spending)
spend.spending = 16000

// example2
@propertyWrapper struct Validation {
    private var text: String
    private var defaultValue: String
    var isValid: Bool
    var wrappedValue: String {
        set {
            text = newValue
        }
        get {
            text.isEmpty ? defaultValue : text
        }
    }

    var projectedValue: Self {
        self
    }

    init(wrappedValue: String, defaultValue: String) {
        text = wrappedValue
        self.defaultValue = defaultValue
    }
}

struct User {
    @Validation(defaultValue: "Non") var name: String = ""

    func greeting() {
        print("hello, \(name)", terminator: " ")

        if ($name.isValid) {
            print("one")
        } else {
            print("two")
        }
    }
}

var user = User()
print(user.name)
user.greeting()
user.name = "emorydu"
print(user.name)
user.greeting()
```
## PropertyWrapper的建立
1. 在类型前加上@propertyWrapper
2. 需要有一个至少可以get的wrappedValue属性，并设计对应的、需要重复利用的set/get/willSet/didSet
3. 可以加上projectedValue属性，这个属性会通过$投射出去
4. 自己建立init时，把wrappedValue放最前面的参数
5. 使用struct自动建立的init时，需要将wrappedValue放在最上面

## 套用Property Wrapper
1. 在需要的属性前方加上@Wrapper名称
2. 会多出一个底线开头版本的私有属性，是这个struct wrapper本身
3. 如果有设定projectedValue则会多出$开头版本的属性，值就是对应的投射属性
```swift
@Wrapper var a = 0
@Wrapper(wrapperdValue: 0) var b
// _fieldName = PropertyWrapper type
// $fieldName = _filedName.projectedValue
// fieldName = _fieldName.wrappedValue
```

## 限制
1. 被装饰的属性不能是计算属性
2. 被装饰的属性不能是全域属性
3. 被装饰的属性不能是lazy、weak、unowned的
4. PropertyWrapper类型本身和wrappedValue、projectedValue必须要有同样的access control level
