# Range
1. 建立一段从小到大的数字
2. a..<b：a到小于b的所有数字
3. a...b：a到b的所有数字
4. a...：所有等于大于a的数字
5. ...a：所有小于或等于a的数字
6. ..<a：所有小于a的数字

## Range相关属性
1. .isEmpty Bool
2. .count   Int
3. .first   Bound?
4. .last    Bound?
5. .lowerBound Bound
6. .upperBound Bound

## Bound
1. <>里面是某个类型的代称
```swift
func contains<T>(_ other: T) -> Bool where T : StringProtocol
func Range<Bound> where Bound : Comparable
// 实际建立/执行时才知道那个类型是什么

let range = 0..<4   // Range<Int>
let range1 = 0.0..<4.0 // Range<Double>
let range2 = "a"..<"z"  // Range<String>
let range3 = 0...4  // ClosedRange<Int>
let range4 = 0... // PartialRangeFrom<Int>
// 在Range里，这个建立时才知道的类型就使用Bound代称 
```
## Range相关方法
1. .contains(Bound) Bool
2. .randomElement() Bound?
3. .overlaps(另一个Range) Bool
4. .clamped(to: 另一个Range) Range<Bound>

