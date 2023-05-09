
import Foundation

// example1
//  struct Luggage {
//     var weight: Int {
//         didSet {
//             weight = min(10, weight)
//         }
//     }

//     init(weight: Int) {
//         self.weight = min(10, weight)
//     }
//  }

//  var packages = Luggage(weight: 5)
//  print(packages)
//  packages.weight = 13
//  print(packages)
//  packages.weight = 7
//  print(packages)


// example2
// struct LimitMaximum {
//     private(set) var maxValue: Int
//     var value: Int {
//         didSet{
//             value = min(maxValue, value)
//         }
//     }

//     init(maxValue: Int, value: Int) {
//         self.maxValue = maxValue
//         self.value = min(maxValue, value)
//     }
// }

// struct Luggage {
//     var weight: LimitMaximum
// }

// var packages = Luggage(weight: .init(maxValue: 12, value: 23))
// print(packages.weight.value)
// packages.weight.value = 2
// print(packages.weight.value)
// packages.weight.value = 999
// print(packages.weight.value)

// example3
// struct LimitMaximum {
//     private(set) var maxValue: Int
//     var value: Int {
//         didSet{
//             value = min(maxValue, value)
//         }
//     }

//     init(maxValue: Int, value: Int) {
//         self.maxValue = maxValue
//         self.value = min(maxValue, value)
//     }
// }

// struct Luggage {
//     private(set) var _weight: LimitMaximum

//     var weight: Int {
//         get { _weight.value }
//         set { _weight.value = newValue }
//     }
// }
// var packages = Luggage(_weight: .init(maxValue: 10, value: 32))
// print(packages.weight)
// packages.weight = 1
// print(packages.weight)


// example4
@propertyWrapper
struct LimitMaximum {
    private let maxValue: Int
    var wrappedValue: Int {
        didSet{
            wrappedValue = min(maxValue, wrappedValue)
        }
    }

    init(wrappedValue: Int, maxValue: Int) {
        self.wrappedValue = min(maxValue, wrappedValue)
        self.maxValue = maxValue
    }
}

struct Luggage {
    @LimitMaximum(maxValue: 10) var portableWeight: Int = 0
    @LimitMaximum(wrappedValue: 0, maxValue: 25) var checkedWeight: Int
    @LimitMaximum var golfEquipmentWeight: Int

    init(portableWeight: Int, checkedWeight: Int, maxCheckedWeight: Int, golfEquipmentWeight: Int) {
        self.portableWeight = portableWeight
        self._checkedWeight = .init(wrappedValue: checkedWeight, maxValue: maxCheckedWeight)
        self._golfEquipmentWeight = .init(wrappedValue: golfEquipmentWeight, maxValue: 30)
    }
}

var packages = Luggage(portableWeight: 15, checkedWeight: 25, maxCheckedWeight: 22, golfEquipmentWeight: 32)
print(packages.portableWeight)
print(packages.checkedWeight)
print(packages.golfEquipmentWeight)


// code

@propertyWrapper
struct ChangeLog<T> {
    var wrappedValue: T {
        didSet {
            print("📝\(description) ==> \(wrappedValue)")
        }
    }

    private(set) var description: String
}

struct Account {
    @ChangeLog(description: "Use") var use: String = ""
    @ChangeLog(description: "Spending") var spending: Int = 0
}

var spend = Account(use: "Macbook Air M2 purchase", spending: 15000)
print(spend.use, spend.spending)
spend.spending = 16000


@propertyWrapper struct Validation {
    private var text: String
    private var defaultValue: String
    var isValid: Bool
    var wrappedValue: String {
        set {
            text = newValue
        }
        get {
            text.isEmpty ? defaultValue : text
        }
    }

    var projectedValue: Self {
        self
    }

    init(wrappedValue: String, defaultValue: String) {
        text = wrappedValue
        self.defaultValue = defaultValue
    }
}

struct User {
    @Validation(defaultValue: "Non") var name: String = ""

    func greeting() {
        print("hello, \(name)", terminator: " ")

        if ($name.isValid) {
            print("one")
        } else {
            print("two")
        }
    }
}

var user = User()
print(user.name)
user.greeting()
user.name = "emorydu"
print(user.name)
user.greeting()

