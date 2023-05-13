
import Foundation

final class Reference<T> {
    var value: T

    init(_ value: T) { self.value = value }
}

struct CopyOnWriteWrapper<T> {
    var reference: Reference<T>

    var value: T {
        get { reference.value }
        set {
            if isKnownUniquelyReferenced(&reference) {
                print("没有其他强连接")
                reference.value = newValue
                return
            }
            print("还有其他强连接")
            reference = Reference(newValue)
            // reference = Reference(newValue)
            // reference.value = newValue
        }
    }

    init(_ value: T) {
        self.reference = Reference(value)
    }
}

var cow = CopyOnWriteWrapper(1)
var cow2 = cow
print("*\(type(of: cow))")  // CopyOnWriteWrapper<Int>
printAddr("cow.reference.value address:",  &cow.reference.value)
printAddr("cow2.reference.value address:", &cow.reference.value)
print("update cow2...")
cow2.value = 2
printAddr("cow2.reference.value address:", &cow2.reference.value)
print(cow.value)

func printAddr(_ msg: String, _ value: inout Int) {
    print(msg, terminator: " ")
    withUnsafePointer(to: &value) { ptr in print(ptr) }
}


extension String {
    static func * (string: String, count: Int) -> String {
        Array.init(repeating: string, count: count).joined()
    }

    static func *= (string: inout String, count: Int) {
        string = string * count
    }
}


var string = "Swift!"
string *= 3
print(string)