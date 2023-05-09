# Enumeration
1. 建立时需列出所有选项
2. 可以conforms to protocol、可以有静态属性也可以有方法
3. 没有存储属性，但是有Associated Value，可以存取的方式不同
4. 是Value Type
```swift
enum PaymentMethod {
    case cash, swipeCard, eWallet, shoppingVoucher
}

func payment(_ methods: PaymentMethod) {
    switch methods {
    case .cash:
    case .swipeCard:
    case .eWallet:
    case .shoppingVoucher:
    }
}

payment(.cash)
payment(.swipeCard)
payment(.eWallet)
payment(.shoppingVoucher)


// Associated Value
enum PaymentMethod {
    case cash, swipeCard(number: String), eWallet(qrCode: Data), shoppingVoucher(number: String)
}
let method = PaymentMethod.swipeCard(number: "12342343")

// 存取Associated Value
switch method {
case .swipeCard(let number):
    print("\(number)")
}


switch method {
case .swipeCard(number: let number):
    print("\(number)")    
}

if case PaymentMethod.swipeCard(let nubmer) = method {
    print(number)
}
```

## Hashable
1. 没有associated value的enum预设就是Hashable的
2. 如果有associated value，必须自己明确写出Hashable，如果里面每一个值都是Hashable的话会自动提供hash方法

## RawRepresentable
1. 这个protocol代表可以在这个类型本身跟RawValue之间来回转换
```swift
struct IDCard: RawRepresentable {
    var name: String
    var id: String

    typealias RawValue = String

    init(rawValue: String) {
        let name = findLibrary(idCardNumber: rawValue)
        self = IDCard(name: name, id: rawValue)
    }

    var rawValue: String { id }
}
```
## 直接为enum宣告RawValue
1. enum提供快速串接String、Int、Float、Double作为RawValue的宣告方法
2. 用第一个位置代表RawValue
3. 前提是没有associated value
```swift
enum PaymentMethod: String {
    case cash, swipeCard, eWallet, shoppingVoucher  // rawValue is cash ....
}

// 自定义RawValue
// 覆盖预设的RawValue
enum PaymentMethod: String {
    case cash = "💰"
    case swipeCard = "💳"
    case eWallet = "👾"
    case shoppingVoucher = "🗾"
}
print(PaymentMethod.cash.rawValue)
```
## CaseIterable
1. 一个知道怎么loop自己全部的实例的类型
2. 没有任何associated value的enum可以直接conform
```swift
static var allCases: Self.AllCases
// A collection of all values of this type.
// required
```