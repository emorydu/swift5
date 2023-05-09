
import Foundation

// example1
// struct Square {
//     var sideLength: Double
//     var area: Double {
//         get {
//             print("Area being calculated")
//             return sideLength * sideLength
//         }

//         set {
//             print("Side lengths are being modified")
//             sideLength = sqrt(newValue)
//         }
//     }
// }

// var square = Square(sideLength: 3)
// print(square.area)
// print(square.area)
// print(square.area)
// print(square.area)
// print(square.area)
// square.sideLength = 4

// print(square.area)
// // square.area = 16    // error: cannot assign to property: 'area' is a get-only property


// // append set methods
// square.area = 64
// print(square.sideLength)


// example2
// struct Square {
//     var sideLength: Double {
//         willSet {
//             area = newValue * newValue
//         }

//         didSet {
//             print("\(oldValue) -> \(sideLength)")
//         }
//     }
//     private(set) var area: Double
// }

// var square = Square(sideLength: 3, area: 9)
// print(square.area)

// square.sideLength = 10
// print(square.area)

// example3
struct Square {
    var sideLength: Double {
        willSet {
            area = newValue * newValue
        }

        didSet {
            // print("\(oldValue) -> \(sideLength)") 
        }
    }
    lazy private(set) var area: Double = {
        print("Area is being calculated and assigned a value")
        return sideLength * sideLength
    }()
}

var square = Square(sideLength: 3)
print(square)

square.sideLength = 10
print(square.area)
