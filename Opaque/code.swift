

import Foundation

// example1
// func getLargeGeneric<T: Comparable>(_ a: T, _ b: T) -> T {
//     a > b ? a : b
// }

// func getLargeOpaque<T: Comparable>(_ a: T, _ b: T) -> some Comparable {
//     a > b ? a : b
// }

// let r = getLargeGeneric(1, 2)
// let o = getLArgeOpaque(1, 2)

// example2
// Opaque用途：省略不必要的复杂类型，专注在功能上
let range = 1...1000
print("type:", type(of: range))

let reversal = range.reversed()
print("reversal type:", type(of: reversal))
let top5 = reversal.prefix(5)
print("top5 type:", type(of: top5))

func last5<T: Sequence>(_ sequence: T) -> some Sequence {
    sequence.reversed().prefix(5)
}

let result = last5(1...1000)
print(result.map{ String(describing: $0) })


// office example
protocol Shape {
    func draw() -> String
}

struct Triangle: Shape {
    var size: Int

    func draw() -> String {
        var result: [String] = []
        for length in 1...size {
            result.append(String(repeating: "*", count: length))
        }
        return result.joined(separator: "\n")
    }
}

let smallTriangle = Triangle(size: 3)
print(smallTriangle.draw())

struct FlippedShape<T: Shape>: Shape {
    var shape: T
    func draw() -> String {
        let lines = shape.draw().split(separator: "\n")
        return lines.reversed().joined(separator: "\n")
    }
}

let flippedTriangle = FlippedShape(shape: smallTriangle)
print(flippedTriangle.draw())

print()


struct JoinedShape<T: Shape, U: Shape>: Shape {
    var top: T
    var bottom: U
    func draw() -> String {
        return top.draw() + "\n" + bottom.draw()
    }
}
let joinedTriangles = JoinedShape(top: smallTriangle, bottom: flippedTriangle)
print(joinedTriangles.draw())

print()

struct Square: Shape {
    var size: Int 
    func draw() -> String {
        let line = String(repeating: "*", count: size)
        let result = Array<String>(repeating: line, count: size)
        return result.joined(separator: "\n")
    }
}

func makeTrapezoid() -> some Shape {
    let top = Triangle(size: 2)
    let middle = Triangle(size: 2)
    let bottom = FlippedShape(shape: top)
    let trapezoid = JoinedShape(top: top, bottom: JoinedShape(top: middle, bottom: bottom))
    return trapezoid
}

let trapezoid = makeTrapezoid()
print(trapezoid.draw())