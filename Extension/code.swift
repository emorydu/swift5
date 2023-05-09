

import Foundation

extension Int {
    var toDouble: Double {  // 计算属性
        Double(self)
    }

    func square() -> Int { self * self }    // 实例方法

    static let one: Int = 1 // 静态属性

    static func random() -> Self {  // 静态方法
        random(in: Int.min...Int.max)
    }

    init(_ bool: Bool) {    // 启动器
        self = bool ? 1 : 0
    }
}

// let number: Int = 100
// print(number.toDouble)
// print(Int.one)
// print(number.square())
// print(Int.random())
// print(Int.init(true))
// print(Int.init(false))

// example1
// 方便转换数字为String的extension
// extension Numeric {
//     func formatted() -> String {
//         let formatter = NumberFormatter()
//         formatter.numberStyle = .decimal
//         return formatter.string(for: self)!
//     }
// }

// let number = 1000
// print(number.formatted())
// print(20003232.formatted())
// print(2332.232.formatted())
// print(Decimal(3232).formatted())


// example2
extension Locale {
    static let zh: Locale = .init(identifier: "zh-CN")
    static let hk: Locale = .init(identifier: "zh-hant-hk")
}

// extension Numeric {
//     func formatted(by style: NumberFormatter.Style = .decimal, locale: Locale = .zh) -> String {
//         let formatter = NumberFormatter()
//         formatter.numberStyle = style
//         formatter.locale = locale
//         return formatter.string(for: self)!
//     }
// }

// let number = 1000
// print(number.formatted())
// print(20003232.formatted(by: .currency))
// print(2332.232.formatted())
// print(Decimal(32323243234).formatted(by: .spellOut, locale: .hk))


// example3
extension NumberFormatter {
    static let decimalFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }()

    static let currencyFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = .zh
        return formatter
    }()
}

extension Numeric {
    func formatted(formatter : NumberFormatter = .decimalFormatter) -> String {
        formatter.string(for: self)!
    }
}

let number = 1000
print(number.formatted())

print(number.formatted(formatter: .currencyFormatter))


// ios15 after...
print(number.formatted(.number))

print(number.formatted(.currency(code: "CNY")))
print(number.formatted(.currency(code: "USD")))


// example4
// 新增启动方式、protocol、类型、归纳整理code
struct Cat {
    var name: String
    var color: String
}

extension Cat {
    enum Color: String {
        case orange, yellow, black, grey, white, blue
    }

    init(name: String, color: Color) {
        self.name = name
        self.color = color.rawValue
    }
}

extension Cat: Equatable {

}

extension Cat: CustomStringConvertible {
    var description: String {
        "\(color) \(name)"
    }
}

let tomcat = Cat(name: "tomcat", color: "orange")
let tom: Cat = Cat(name: "tom", color: .blue)
print(tomcat)
print(tom)
print(tom == tomcat)

// example5
// 新增subscript
extension String {
    subscript(_ offset: Int) -> Character? {
        guard offset >= 0, let index = self.index(startIndex, offsetBy: offset, limitedBy: index(before: endIndex)) else {
            return nil
        }
        return self[index]
    }
}

let string = "Hello, Swift!"
// if let character = string[3] {
//     print(character)
// }
for index in -1...string.count {
    print(string[index] ?? "<nil> ")
}

extension Collection where Element == Int {
    func sum() -> Self.Element {
        print("Element == Int")
        return reduce(0, +)
    }
}

extension Collection where Element: Numeric {
    func sum() -> Self.Element {
        print("Element is Numeric")
        return reduce(.zero, +)
    }
}

print([1, 2, 3, 4, 5].sum())   // Element == Int

print([1, 2, 3, 4, 5.1].sum()) // Element is Numeric