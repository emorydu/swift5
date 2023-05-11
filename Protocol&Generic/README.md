# Protocol

|        | Equatable      | Comparable   | Hashable      | Sequence                          | Collectioin                                      |
| ------ | -------------- | ------------ | ------------- | --------------------------------- | ------------------------------------------------ |
| 继承自 |                | Equatable    | Equatable     |                                   | Sequence                                         |
| 特色   | 可以判断是相等 | 可以比较大小 | 可以hash成int | 知道如何寻找下一个资料            | 可以用[Index]存取个别资料                        |
| 要求   | ==             | <            | .hash()       | .makeIterator()                   | subscript(index)<br>.startIndex()<br>.endIndex() |
| 功能   | !=             | ><br>.sort() | .hashValue()  | for ... in ....<br>.shuffled()    | [Index]<br>.isEmpty                              |
| 例子   | 基本类型都是   | 基本类型都是 | 基本类型都是  | String<br>Range<br>三大Collection | String<br/>Range<br/>三大Collection              |

1. 将特色独立、套用通用的功能、提供设计的蓝图
```swift
// 建立protocol
// 1. 方法只要定义名称、参数、返回值
// 2. 描述该如何设计某个东西
// 3. 可能是描述某种特性或一系列相关的功能
protocol Equatable {
    static func == (lhs: Self, rhs: Self) -> Bool
}

// 1. 所有属性都用var宣告，只需要写名称、类型以及是否能get 和 set
protocol HasProfile {
    var name: String { get set }
    var birth: Date { get }
    var age: Int { get }
}

// 提供预设值
// 1. 在extension中设定同样名称的属性或方法，conform的时候就不一定需要设定
extension Date {
    var year: Int {
        Calendar(identifier: .gregorian).dateComponents(in: .current, from: self).year!
    }
}

extension HasProfile {
    var age: Int {
        Date.now.year - birth.year
    }
}


// 要求conforms to 其他 protocol
protocol HasProfile: Equatable {
    var name: String { get set }
    var birth: Date { get }
    var age: Int { get }
}

// extension HasProfile: Equatable {} // error

extension HasProfile {
    public static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.name == rhs.name
    }
}


// 使用Generic
protocol HasProfile {
    associatedtype Pwd: Hashable
    
    var name: String { get set}
    var birth: Date { get }
    var pwd: Pwd { get }
}

struct User: HashProfile {
    typealias Pwd = String
    var name: String
    var birth: Date
    var pwd: String
}
```
## Collection相关Protocol
1. Sequence：会呼叫下一个Iterator
2. Collection：通过index存取 Dictionary、Set
3. BidirectionalCollection：可以双向Loop String
4. Random Access Collection：通过index+/-Int获取另一个可用的index Array
## .isEmpty VS .count == 0
1. .isEmpty优于.count == 0
2. .isEmpty只要比对开始跟结束位置。一定都是一次完成
3. .count只有在Random Access Collection才能一次完成，否则就Loop
## Generic
1. 使用时才知道的类型的代称
```swift
struct Array<Element>

struct Dictionary<Key, Value> where Key : Hashable
struct Dictionary<Key: Hashable, Value>

func min<T>(_ x: T, _ y: T) -> T where T : Comparable
func min<T: Comparable>(x _: T, _ y: T) -> T

func sorted() -> [Element]
```

## Protocol实战演练场
```swift
// example1
protocol Growable {
    var name: String { get }
    var hp: Int { get set }
    var maxHP: Int { get set }
    var attackPower: Int { get set }
    var level: Int { get set }

    init()
}

extension Growable {
    mutating func reset() {
        hp = maxHP
    }

    mutating func upgrade() {
        maxHP = Int(Double(maxHP) * 1.1)
        hp = maxHP
        attackPower = Int(Double(attackPower) * 1.2)
        level += 1
        print("\(name) has been upgraded to \(level) and now has life \(hp); attack power \(attackPower).")
    }
}

struct Pokemon: Growable {
    var name: String = "Pokemon"
    var hp: Int = 55
    var maxHP: Int = 55
    var attackPower: Int = 5
    var level: Int = 1
}

struct EvilAliens: Growable {
    var name: String = "EvilAliens"
    var hp: Int = 66
    var maxHP: Int = 66
    var attackPower: Int = 6
    var level: Int = 1
}

var pikachu = Pokemon(name: "pikachu")
var aliens: EvilAliens = EvilAliens(name: "aliens")

pikachu.upgrade()
aliens.upgrade()


// example2
protocol Combatable {
    var name: String { get }
    var hp: Int { get set }
    var maxHP: Int { get set }
    var attackPower: Int { get set }
    var level: Int { get set }

    init()
}

extension Combatable {
    mutating func reset() {
        hp = maxHP
        print("😴😴😴\(name) Sleep well, life value replenished.")
    }

    mutating func upgrade() {
        maxHP = Int(Double(maxHP) * 1.1)
        hp = maxHP
        attackPower = Int(Double(attackPower) * 1.2)
        level += 1
        print("✨✨✨\(name) has been upgraded to \(level) and now has life \(hp); attack power \(attackPower).")
    }

    func attack<T: Combatable>(on target: inout T) {
        target.hp -= self.attackPower
        print("👾👾👾\(name) deals \(attackPower) points of damage to \(target.name), \(target.name) is now left with \(target.hp) points of life.")
    }
}

struct Pokemon: Combatable {
    var name: String = "Pokemon"
    var hp: Int = 55
    var maxHP: Int = 55
    var attackPower: Int = 5
    var level: Int = 1
}

struct EvilAliens: Combatable {
    var name: String = "EvilAliens"
    var hp: Int = 66
    var maxHP: Int = 66
    var attackPower: Int = 6
    var level: Int = 1
}

var pikachu = Pokemon(name: "pikachu")
var aliens: Combatable = EvilAliens(name: "aliens")

pikachu.upgrade()
aliens.upgrade()
pikachu.attack(on: &aliens)
aliens.reset()



// example3
protocol Combatable {

    associatedtype Level

    var name: String { get }
    var hp: Int { get set }
    var maxHP: Int { get set }
    var attackPower: Int { get set }
    var level: Level { get set }

    init()

    mutating func modifyLevel()
}

extension Combatable {
    mutating func reset() {
        hp = maxHP
        print("😴😴😴\(name) Sleep well, life value replenished.")
    }

    mutating func upgrade() {
        maxHP = Int(Double(maxHP) * 1.1)
        hp = maxHP
        attackPower = Int(Double(attackPower) * 1.2)
        // level += 1
        modifyLevel()
        print("✨✨✨\(name) has been upgraded to \(level) and now has life \(hp); attack power \(attackPower).")
    }

    func attack<T: Combatable>(on target: inout T) {
        target.hp -= self.attackPower
        print("👾👾👾\(name) deals \(attackPower) points of damage to \(target.name), \(target.name) is now left with \(target.hp) points of life.")
    }
}

struct Pokemon: Combatable {
    var name: String = "Pokemon"
    var hp: Int = 55
    var maxHP: Int = 55
    var attackPower: Int = 5
    var level: Int = 1
}

struct EvilAliens: Combatable {
    var name: String = "EvilAliens"
    var hp: Int = 66
    var maxHP: Int = 66
    var attackPower: Int = 6
    var level: Int = 1
}

extension Combatable where Level == Int {
    mutating func modifyLevel() {
        level += 1
    }
}

struct Samurai: Combatable {
    enum Classes: Int {
        case youngPadwan, apprentice, jediKnight, grandMaster, powerMaster
    }

    var name: String = "Samurai"
    var hp: Int = 77
    var maxHP: Int = 77
    var attackPower: Int = 7
    var level: Classes = .youngPadwan

    mutating func modifyLevel() {
        let level = level.rawValue + 1
        self.level = Classes(rawValue: level) ?? .powerMaster
    }
}


var pikachu: Pokemon = Pokemon(name: "pikachu")
pikachu.upgrade()
var samurai: Samurai = Samurai(name: "samurai")
samurai.upgrade()
samurai.attack(on: &pikachu)


// example4
protocol Combatable {

    associatedtype Level: Strideable where Level.Stride == Int

    var name: String { get }
    var hp: Int { get set }
    var maxHP: Int { get set }
    var attackPower: Int { get set }
    var level: Level { get set }

    init()

    mutating func modifyLevel()
}

extension Combatable {
    mutating func reset() {
        hp = maxHP
        print("😴😴😴\(name) Sleep well, life value replenished.")
    }

    mutating func upgrade() {
        maxHP = Int(Double(maxHP) * 1.1)
        hp = maxHP
        attackPower = Int(Double(attackPower) * 1.2)
        // level += 1
        level = level.advanced(by: 1)
        // modifyLevel()
        print("✨✨✨\(name) has been upgraded to \(level) and now has life \(hp); attack power \(attackPower).")
    }

    func attack<T: Combatable>(on target: inout T) {
        target.hp -= self.attackPower
        print("👾👾👾\(name) deals \(attackPower) points of damage to \(target.name), \(target.name) is now left with \(target.hp) points of life.")
    }
}

struct Pokemon: Combatable {
    var name: String = "Pokemon"
    var hp: Int = 55
    var maxHP: Int = 55
    var attackPower: Int = 5
    var level: Int = 1
}

struct EvilAliens: Combatable {
    var name: String = "EvilAliens"
    var hp: Int = 66
    var maxHP: Int = 66
    var attackPower: Int = 6
    var level: Int = 1
}

extension Combatable where Level == Int {
    mutating func modifyLevel() {
        level += 1
    }
}

struct Samurai: Combatable {
    enum Classes: Int, Strideable {
        case youngPadwan, apprentice, jediKnight, grandMaster, powerMaster
        typealias Stride = Int

        func advanced(by n: Int) -> Samurai.Classes {
            let level = rawValue + n
            return Classes.init(rawValue: level) ?? .powerMaster
        }

        func distance(to other: Samurai.Classes) -> Int {
            other.rawValue - self.rawValue
        }
        
    }

    var name: String = "Samurai"
    var hp: Int = 77
    var maxHP: Int = 77
    var attackPower: Int = 7
    var level: Classes = .youngPadwan

    mutating func modifyLevel() {
        let level = level.rawValue + 1
        self.level = Classes(rawValue: level) ?? .powerMaster
    }
}


var pikachu: Pokemon = Pokemon(name: "pikachu")
pikachu.upgrade()
var samurai: Samurai = Samurai(name: "samurai")
samurai.upgrade()
samurai.attack(on: &pikachu)

```
## 没有associated type的Protocol可以直接当做类型使用
1. 放在属性、参数、返回值的类型中
2. 使用&来结合
```swift
protocol HasName {
    var name: String { get }
}
protocol HasAddress {
    var address: String { get }
}

let array: [HasName & HasAddress] = []


// 
//protocol HasName: Equatable {
//    var name: String { get }
//}

//struct Animal: HasName {
//    var name: String
//}

//struct Dog: HasName {
//    var name: String
//}

//func doSomething<T: HasName>(array: [T]) {}

//doSomething(array: [Animal(name: "cat"), Dog(name: "dog")])
```