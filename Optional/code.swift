
import Foundation

// example1
let nubmer:Int? = Optional<Int>.none
let nubmer2: Int? = Int?.some(5)
let nubmer3: Int? = nil
let number4: Int? = 9

let array = [nubmer, nubmer2, nubmer3, number4]
for number in array {
    switch number {
    case .none:
        print("<nil>")
    case .some(let wrapped):
        print(wrapped)
    }
}


// example2
// let someNumber: Int? = nil
let someNumber: Int? = 100
// let wrappedSomeNumber: Int = someNumber! //  Fatal error: Unexpectedly found nil while unwrapping an Optional value
// print(wrappedSomeNumber)s

let defaultValue: Int = someNumber ?? 0
print(defaultValue)



// example3
let something: String? = "hello, swift"
switch something {
case .some(let string):
    print("\(string)")
case .none:
    break
}

if case Optional<String>.some(let string) = something {
    print("\(string).")
}


let name: String? = "emorydu"
if let name = name {
    print("hello, \(name).")
}


func greeting(_ name: String?) {
    guard let name = name else {
        return
    }

    print("Hello, \(name).")
}
greeting("lin")
greeting(nil)


struct Profile {
    let name: String
    let phone: String?
}

let profile: Profile? = .init(name: "Emory", phone: "328384278")

if let profile = profile, let phone = profile.phone {
    print(phone)
}

print(profile?.phone)

let profiles: [Profile?] = [.init(name: "Emory", phone: nil), .init(name: "Lin", phone: "233233245")]
print(profiles.map(\.?.phone))
print(profiles.compactMap(\.?.phone))