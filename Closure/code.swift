
import Foundation

let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

func backward(_ s1: String, _ s2: String) -> Bool {
    return s1 > s2
}

var reversedNames = names.sorted(by: backward)
print(reversedNames)

reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in 
    return s1 > s2
})
print(reversedNames)


reversedNames = names.sorted(by: { s1, s2 in return s1 > s2 })
print(reversedNames)

reversedNames = names.sorted(by: { s1, s2 in s1 > s2 })
print(reversedNames)

reversedNames = names.sorted(by: { $0 > $1 })
print(reversedNames)


reversedNames = names.sorted(by: >)
print(reversedNames)


// 如果你需要将一个很长的闭包表达式作为最后一个参数传递给函数，将这个闭包替换成为尾随闭包的形式很有用。
// 尾随闭包是一个书写在函数圆括号之后的闭包表达式，函数支持将其作为最后一个参数调用。在使用尾随闭包时，你不用写出它的参数标签
reversedNames = names.sorted() {
    $0 > $1
}
print(reversedNames)

reversedNames = names.sorted {
    $0 > $1
}
print(reversedNames)


// Other Function
// .map()
typealias Fruit = (name: String, price: Double)
let fruits: [Fruit] = [(name: "Apple", price: 32.3), (name: "Banana", price: 43.4)]
print(fruits.map { fruit in 
    return "\(fruit.name) \(fruit.price)."
})

// .reduce()
print(fruits.reduce(0) { total, fruit in 
    total + fruit.price
})

// .filter()
print(fruits.filter { fruit in 
    fruit.price > 35
})

// .contains()
print(fruits.contains(where: { (name, _) in name == "Banana" }))
