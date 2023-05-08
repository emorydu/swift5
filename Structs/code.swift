
struct Human: Equatable {

    static var population = 0

    var name: String
    private(set) var age = 24
    var height = 163.0

    init(name: String) {
        self.name = name
        Self.population += 1
    }

    init(name: String, age: Int, height: Double) {
        self.name = name
        self.age = age
        self.height = height
        Self.population += 1
    }

    mutating func birthday() {
        self.age += 1
    }
    
    mutating func reset() {
        self = Human(name: "None", age: 0, height: 54)
    }
    // static func == (lhs: Self, rhs: Self) -> Bool {
    //     if lhs.name == rhs.name && 
    //     lhs.age == rhs.age && 
    //     lhs.height == rhs.height {
    //         return true
    //     }
    //     return false
    // }

}

var emory = Human(name: "emory")
let emorydu = Human(name: "emory")
print(emorydu)


let smith: Human = Human(name: "smith", age: 23, height: 173)
print(smith)

print(emory == emorydu) // conforms to Equatable

emory.birthday()
print(emory)
emory.reset()
print(emory)
print(Human.population)


struct PrintManager {
    static func alert(_ message: String) {
        print("🚨\(message)")
    }
    
    static func notification(_ message: String) {
        print("📵\(message)")
    }
    
    static func success(_ message: String) {
        print("✅\(message)")
    }
}

PrintManager.alert("hello, world")
PrintManager.notification("hello, world")
PrintManager.success("hello, world")