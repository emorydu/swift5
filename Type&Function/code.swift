
import Foundation

// Tuple
let http404Error = (404, "Not Found")
let (statusCode, statusMessage) = http404Error
print("The status code is \(statusCode)")
print("The status message is \(statusMessage)")

let (justTheStatusCode, _) = http404Error
print("The status code is \(justTheStatusCode)")

print("The status code is \(http404Error.0)")
print("The status message is \(http404Error.1)")

let http200Status = (statusCode: 200, description: "OK")
print("The status code is \(http200Status.statusCode)")
print("The status message is \(http200Status.description)")




// function

// exmaple1
func greet(person: String) -> String {
    let greeting = "Hello, " + person + "!"
    return greeting
}

print(greet(person: "emorydu"))
print(greet(person: "Lin"))

func greetAgain(person: String) -> String {
    return "Hello, again, " + person + "!"
}
print(greetAgain(person: "emorydu"))

// exmaple2
func sayHelloSwift() -> String {
    "hello, swift"
}

print(sayHelloSwift())

func greet(person: String, alreadyGreeted: Bool) -> String {
    if alreadyGreeted {
        return greetAgain(person: person)
    } else {
        return greet(person: person)
    }
}

print(greet(person: "emorydu", alreadyGreeted: true))


// example3
func printAndCount(string: String) -> Int {
    print(string)
    return string.count
}

func printWithoutCounting(string: String) {
    let _ = printAndCount(string: string)
}

printAndCount(string: "hello, swift")
printWithoutCounting(string: "hello, swift")

// example4
func minMax(array: [Int]) -> (min: Int, max: Int) {
    var currentMin = array[0]
    var currentMax = array[0]

    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}

let bounds = minMax(array: [8, 32, -9, 4123, 3])
print("min is \(bounds.min) and max is \(bounds.max)")


func minMaxOptional(_ array: [Int]) -> (min: Int, max: Int)? {
    if array.isEmpty { return nil }
     var currentMin = array[0]
    var currentMax = array[0]

    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}
if let boundsOptional = minMaxOptional([8, 32, -9, 4123, 3]) {
    print("min is \(boundsOptional.min) and max is \(boundsOptional.max)")
}

// exmaple5
func greet(person: String = "emorydu", from hometown: String) -> String {
    "Hello \(person)! Glad you could visit form \(hometown)."
}
print(greet(person: "emorydu", from: "Shanghai"))


// exmaple6
func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temp = a
    a = b
    b = temp
}

var someInt = 3
var anotherInt = 4
swapTwoInts(&someInt, &anotherInt)
print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")

// example7
func addTwoInts(_ a: Int, _ b: Int) -> Int {
    a + b
}

func multiplyTwoInts(_ a: Int, _ b: Int) -> Int {
    a * b
}

func printHelloWorld() {
    print("hello, world")
}

var mathFucntion: (Int, Int) -> Int = addTwoInts

print("Result: \(mathFucntion(2, 3))")

mathFucntion = multiplyTwoInts
print("Result: \(mathFucntion(2, 3))")


func printMathResult(_ mathFunction: (Int, Int) -> Int, _ a: Int, _ b: Int) {
    print("Result: \(mathFunction(a, b))")
}

printMathResult(addTwoInts, 3, 4)


// exmaple8
// func stepForward(_ input: Int) -> Int {
//     return input + 1
// }

// func stepBackward(_ input: Int) -> Int {
//     return input - 1
// }

// func chooseStepFunction(backward: Bool) -> (Int) -> Int {
//     return backward ? stepBackward : stepForward
// }

// var currentValue = 3
// let moveNearerToZero = chooseStepFunction(backward: currentValue > 0)

// print("Counting to zero:")
// while currentValue != 0 {
//     print("\(currentValue)...")
//     currentValue = moveNearerToZero(currentValue)
// }
// print("zero!")

func chooseStepFunction(backward: Bool) -> (Int) -> Int {
    func stepForward(input: Int) -> Int { return input + 1 }
    func stepBackward(input: Int) -> Int { return input - 1 }
    return backward ? stepBackward : stepForward
}
var currentValue = -4
let moveNearerToZero = chooseStepFunction(backward: currentValue > 0)
// moveNearerToZero now refers to the nested stepForward() function
while currentValue != 0 {
    print("\(currentValue)... ")
    currentValue = moveNearerToZero(currentValue)
}
print("zero!")
// -4...
// -3...
// -2...
// -1...
// zero!

