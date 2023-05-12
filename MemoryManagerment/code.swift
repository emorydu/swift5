
import Foundation

// example1
// struct Cat {
//     var name: String
// }

// class Dog {
//     var name: String

//     init(_ name: String) {
//         self.name = name
//     }
// }
// var kitty: Cat = Cat(name: "kitty")
// print(kitty)

// var dog: Dog = Dog("SunnyGao")
// var dog2: Dog = dog
// dog2.name = "tw"
// print(dog)
// dump(dog)

// example2
// class Dog {
//     var name: String

//     init(_ name: String) { self.name = name }

//     deinit {
//         print("\(name) deinit...")
//     }
// }

// var dog: Dog? = Dog("tw")
// var dog2 = dog
// dog = nil
// dog2 = nil
// print("finish")

// example3
// class Cat {
//     var name: String
//     var friend: Cat?

//     init(_ name: String) { self.name = name }

//     deinit {
//         print("Cat: \(name) deinit...")
//     }
// }

// var tomcat: Cat? = Cat("tomcat")
// var tom: Cat? = Cat("tom")

// tom?.friend = tomcat    // !!

// print(">> \(tomcat!.name) = nil")
// tomcat = nil

// print(">> \(tom!.name) = nil")
// tom = nil 
// print("finish")

// example4
// class Cat {
//     var name: String
//     var friend: Cat?

//     init(_ name: String) { self.name = name }

//     deinit {
//         print("Cat: \(name) deinit...")
//     }
// }

// var tomcat: Cat? = Cat("tomcat")
// var tom: Cat? = Cat("tom")

// tom?.friend = tomcat    // !!
// tomcat?.friend = tom    // !!

// print(">> \(tomcat!.name) = nil")
// tomcat = nil

// print(">> \(tom!.name) = nil")
// tom = nil 
// print("finish")

// example5
// class Cat {
//     var name: String
//     weak var friend: Cat?

//     init(_ name: String) { self.name = name }

//     deinit {
//         print("Cat: \(name) deinit...")
//     }
// }

// var tomcat: Cat? = Cat("tomcat")
// var tom: Cat? = Cat("tom")

// tom?.friend = tomcat    // !!
// tomcat?.friend = tom    // !!

// print(">> \(tomcat!.name) = nil")
// tomcat = nil

// print(">> \(tom!.name) = nil")
// tom = nil 
// print("finish")



class Membership {
    var ordersInProcess: Order?

    deinit {
        print("Membership deinit...")
    }
}

class Order {
    unowned var orderer: Membership

    init(orderer: Membership) { self.orderer = orderer }
}

var user: Membership? = Membership()
var order: Order? = Order(orderer: user!)
user?.ordersInProcess = order

user = nil
order = nil

print("finish")