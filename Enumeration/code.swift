
import Foundation

// example1
enum Season: String, CaseIterable, CustomStringConvertible {
    case spring, summer, fall, winter   // rawValue = spring ...

    var description: String {
        rawValue
    }

}

let season = Season.summer
print(String(describing: season))
print(String(describing: Season.allCases))
print(Season.init(rawValue: "winter")!)  // Optional(spring)



enum CloudMethod: Double, CaseIterable, CustomStringConvertible {
    case aliyun, azure, aws

    var description: String {
        rawValue.description
    }
}

print(CloudMethod.allCases)


// example2
enum MembershipLevel: String, CaseIterable {
    case free, silver, gold

    enum Permissions: String, CaseIterable {
        case watchOld, skipAds, download, watchNew
    }

    var price: Int {
        switch self {
        case .free:
            return 0
        case .silver:
            return 200
        case .gold:   
            return 400 
        }
    }

    func can(_ permission: Permissions) -> Bool {
        switch self {
        case .free:
            return permission == .watchOld
        case .silver:
            return permission != .watchNew
        case .gold:
            return true    
        }
    }

    static let allLevel = "Please select the type of membership you want to join: \(MembershipLevel.allCases.map(\.rawValue).joined(separator: " , "))"
}

print(MembershipLevel.allLevel)

let level = MembershipLevel.allCases.randomElement()!
print("welcome to join: \(level)")
MembershipLevel.Permissions.allCases.forEach {
    let isAllowed = level.can($0)
    print(isAllowed ? "can \($0.rawValue)" : "cannot \($0.rawValue)")
}


// example3
// enum Gender: /*String*/ CaseIterable, CustomStringConvertible {

//     var description: String {
//         switch self {
//         case .male:
//             return "male"
//         case .female:
//             return "female"
//         case .other(description: let description):
//             return description
//         }
//     }

//     static var allCases: [Gender] = [.male, .female, .other()]

//     case male, female, other(description: String = "other")
// }

// print(Gender.female)
// print(Gender.other(description: "Boy"))
// print(Gender.other())

// print(Gender.allCases)

// Gender.allCases.forEach {
//     // print($0.rawValue)   // non rawValue (associated value)
//     print($0)
// }



// example4
enum Gender: CaseIterable, RawRepresentable {

    case male, female, other(description: String = "other")

    static var allCases: [Gender] = [.male, .female, .other()]

    typealias RawValue = String

    init(rawValue: String) {
        switch rawValue {
        case "male":
            self = .male 
        case "female":
            self = .female
        default:
            self = .other(description: rawValue)
        }
    }

    var rawValue: String {
        switch self {
        case .male:
            return "male"
        case .female:
            return "female"
        case .other(description: let description):
            return description
        }
    }

    var description: String {
        rawValue
    } 
}

print(Gender.female)
print(Gender.other(description: "Boy"))
print(Gender.other())

// print(Gender.allCases)

// Gender.allCases.forEach {
//     // print($0.rawValue)   // non rawValue (associated value)
//     print($0)
// }


let gender = Gender.init(rawValue: "Boy")
print(gender.rawValue)



