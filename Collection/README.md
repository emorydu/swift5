# Collection
## Array
1. 一连串同类型<Element>资料
2. Element可以是任何类型
3. 帮助资料建立数字的index
4. Array是有顺序的
```swift
let names: Array<String> = []
let names: [String] = []
let names = Array<String>()
let names = [String]()

let names: [String] = ["emorydu", "smith", "Lin"]
let names = Array<String>(["emorydu", "smith", "Lin"])
let names = ["emorydu", "smith", "Lin"]

print(names[0])
print(names[0..<2])
print(names[0...2])

names[0] = "lin"

// 相关属性
// .isEmpty Bool
// .count Int
// .first Element?
// .last Element?
// .startIndex Int
// .endIndex Int

// 相关方法
// .append(Element)
// .insert(Element, at: Int)
// .remove(at: Int) Element
// .removeFirst() Element
// .removeLast() Element
// .removeSubrange(Range)
// .popLast() Element?

// 其他方法
// .contains(Element)   Bool
// .firstIndex(of: Element) Int?
// .randomElement() Element?
// .swapAt(Int, Int)
// .shuffle()
// .shuffled()  Array<Element>

// 当Element是String的时候
// .joined()    String
// .joined(separator: String)   String

// 当Element是可比较的时候
// .sort()
// .sorted()    Array<Element>
// .min()   Element?
// .max()   Element?

```
## Index
1. 有index的资料能使用某种方法从一堆资料中找到单笔资料

## Set
1. 无序不重复
2. 一个类型为了存储在集合中，该类型必须是可哈希化的——也就是说，该类型必须提供一个方法来计算它的哈希值。一个哈希值是 Int 类型的，相等的对象哈希值必须相同，比如 a == b,因此必须 a.hashValue == b.hashValue
3. Swift 的所有基本类型（比如 String、Int、Double 和 Bool）默认都是可哈希化的，可以作为集合值的类型或者字典键的类型。没有关联值的枚举成员值默认也是可哈希化的
4. Set无法存取特定元素
5. 可做集合操作（联集、差集、交集、对称差集）
7. 因为需要通过.hashValue进行快速的存取和运算，Element必须是Hashable的
8. 使用“是否相等”运算符（==）来判断两个集合包含的值是否全部相同
```swift
var set: Set<String> = []
let set = Set<Int>()
let set = Set(["emorydu"])
```
### Hashable

## Dictionary
1. 无序键值对
2. key是Hashable的
```swift
let dict: Dictionary<String, Int> = [:]
let dict: [String: Int] = [:]

let dict = Dictionary<String, Int>()
let dict = [String: Int]()

let dict = ["Key": "Value"]
```