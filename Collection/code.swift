
import Foundation

var someInts: [Int] = []
print("someInts if of type [Int] with \(someInts.count) items.")

someInts.append(3)
print("someInts if of type [Int] with \(someInts.count) items.")
someInts = []
print("someInts if of type [Int] with \(someInts.count) items.")


var threeDoubles = Array<Double>(repeating: 0.0, count: 3)
print(threeDoubles)

var anotherThreeDoubles = Array<Double>(repeating: 2.5, count: 3)
var sixDoubles = threeDoubles + anotherThreeDoubles
print(sixDoubles)

var shoppingList: [String] = ["Eggs", "Milk"]
// var shoppingList = ["Eggs", "Milk"]

if shoppingList.isEmpty {
    print("The shopping list is empty.")
} else {
    print("The shopping list is not empty.")
}
shoppingList.append("Flour")
shoppingList += ["Baking Powder"]
shoppingList += ["Chocolate Spread", "Cheese", "Butter"]

print(shoppingList)

shoppingList[0] = "Six eggs"

shoppingList[4...6] = ["Bananas", "Apples"]
print(shoppingList)

shoppingList.insert("Maple Syrup", at: 0)
print(shoppingList)

let mapleSyrup = shoppingList.remove(at: 0)
print(shoppingList)

let firstItem = shoppingList[0]
print(firstItem)

let apples = shoppingList.removeLast()
print(apples)

for item in shoppingList {
    print(item)
}

for (index, value) in shoppingList.enumerated() {
    print("Item \(String(index + 1)): \(value)")
}

// Set
var letters = Set<Character>()
print("letters if of type Set<Character> with \(letters.count) items.")

letters.insert("a")
print(letters)
letters = []
print(letters)

var favoriteGenres: Set<String> = ["Rock", "Classical", "Hip hop"]
// var favoriteGenres: Set = ["Rock", "Classical", "Hip hop"]
print("I have \(favoriteGenres.count) favorite music genres.")

if favoriteGenres.isEmpty {
    print("As far as music goes, I'm not picky.")
} else {
    print("I have particular music preferences.")
}

favoriteGenres.insert("Jazz")

if let removedGenre = favoriteGenres.remove("Rock") {
    print("\(removedGenre)? I'm over it.")
} else {
    print("I never much cared for that.")
}

if favoriteGenres.contains("Funk") {
    print("I get up on the good foot.")
} else {
    print("It's too funky in here.")
}

for genre in favoriteGenres {
    print("\(genre)")
}

for genre in favoriteGenres.sorted() {
    print("\(genre)")
}

var set: Set<String> = []
print(set)
let set2 = Set<Int>()
print(set2)
var set3 = Set(["emorydu"])
print(set3)
set3.update(with: "emorydu")
set3.insert("lin")
print(set3)
set3.remove("emorydu")
print(set3)

let names = ["emorydu", "emorydu", "lin"]
let nameSet = Set(names)
print(nameSet)

//
let oddDigits: Set = [1, 3, 5, 7, 9]
let evenDigits: Set = [0, 2, 4, 6, 8]
let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]
print(oddDigits.union(evenDigits).sorted())
print(oddDigits.subtracting(singleDigitPrimeNumbers).sorted())
print(oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted())

// 
// 使用“是否相等”运算符（==）来判断两个集合包含的值是否全部相同
let houseAnimals: Set = ["🐶", "🐱"]
let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
let cityAnimals: Set = ["🐦", "🐭"]
print(houseAnimals.isSubset(of: farmAnimals))
print(farmAnimals.isSuperset(of: houseAnimals))
print(farmAnimals.isDisjoint(with: cityAnimals))

// 
struct Fruit: Hashable, Equatable, CustomStringConvertible {
    var name: String
    var description: String { self.name }

    func hash(into hasher: inout Hasher) {
    
    }

    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.name == rhs.name
    }
}

var fruits = Set<Fruit>()
let apple = Fruit(name: "Apple")
let banana = Fruit(name: "Banala")

print("hash equals ? \(apple.hashValue == banana.hashValue)")
print("value equals? \(apple == banana)")

fruits.insert(apple)
fruits.insert(banana)
print(fruits)


// dictionary
var fruitStock = [String: Int]()
fruitStock["Apple"] = 3
fruitStock["Apple"] = 6

fruitStock.updateValue(10, forKey: "Banana")
fruitStock.updateValue(1, forKey: "Banana")

fruitStock["Apple"]! += 6
fruitStock["W", default: 0] += 4
print(fruitStock)


var airports: [String: String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
// var airports = ["YYZ": "Toronto Person", "DUB": "Dublin"]

if airports.isEmpty {
    print("The airports dictionary is empty.")
} else {
    print("The airports dictionary is not empty.")
}

airports["LHR"] = "London"
airports["LHR"] = "London Heathrow"

if let oldValue = airports.updateValue("Dublin Airport", forKey: "DUB") {
    print("The old value for DUB was \(oldValue).")
}

if let airportName = airports["DUB"] {
    print("The name of the airport is \(airportName).")
} else {
    print("That airport is not in the airports dictionary.")
}

airports["APL"] = "Apple Internation"
airports["APL"] = nil   // remove

if let removedValue = airports.removeValue(forKey: "DUB") {
    print("The removed airport's name is \(removedValue).")
} else {
    print("The airports dictionary does not contain a value for DUB")
}

for (airportCode, airportName) in airports {
    print("\(airportCode): \(airportName)")
}

for airportCode in airports.keys {
    print("Airport code: \(airportCode)")
}

for airportName in airports.values {
    print("Airport name: \(airportName)")
}

//
let airportCodes = [String](airports.keys)
print(airportCodes)
let airportNames: [String] = [String](airports.values)
print(airportNames)

// 
var introductions = [String: (english: String, introduction: String)]()
introductions.reserveCapacity(fruits.count)
var myset = Set<Int>()
myset.reserveCapacity(10)
myset.count
Set<Int>.init(minimumCapacity: 10)
Dictionary<String, Int>.init(minimumCapacity: 10)
print(Array<Int>.init(repeating: 0, count: 10))

