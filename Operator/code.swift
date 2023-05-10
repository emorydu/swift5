

import Foundation

print(1 + (-2))
print(8 - 1)
print(3 * 2)
print(8 / 2)
print(3 % 4)

var number = 0
number = number + 5 // number = 5
number += 5 // number = 10
number += number // number = 20

number -= 5
number *= 2
number /= 3
number %= 2

// 100 / 0
// 100 % 0


print("IntMax:\(Int.max), IntMin:\(Int.min)")



// example1
let x = 1 / 2   // Int
print(x)    // 0

let x1 = 1 / 2.0    // Double
print(x1)   // 0.5

let x2: Double = 1 / 2.0
print(x2)   // 0.5 

let a = 1
let b = 2.0
// print(a + b)
print(Double(a) + b)    // 3.0


// example2
let decimal: Decimal = 1
let decimal2 = Decimal(1)

let decimal3: Decimal = 3.24
print(decimal3)

if let decimal4: Decimal = Decimal(string: "3.24") {
    print(decimal4)
}



// String
let text: String = "hello, world!"
print(text.count)
print(text.first!)
print(text.last!)
print(text.uppercased())
print(text.lowercased())


let emoji: String = "🇨🇳"
print(emoji.count)
print(emoji.unicodeScalars.count)
print(emoji.unicodeScalars.first!)
print(emoji.unicodeScalars.last!)


print("🇨" + "🇳")



let zalgo = "ḩ̴̢̢̣̥̖̗͔̝̝̟͉͍̟̯͚͌͂̈́̑̃̀͂̀͑̇͗͝ȩ̸̝̗̙̪̤̖͖̣̦̯̍̇̊̽͌̈́̈̿̆̐l̶̢̧̛̰͉͉̩̠̠̣͎͛̾̆̃̒͌̊̊͌̀̆͜ļ̵̣̣̾̊̊̿̾̓͒̏̑̑͘ͅȍ̷̡̥͍͚̜̝̯̮̮̱̮̺̤̖̫͓̈́͛̈́̈͒̆̓̂̒̏̀͌̅̅̓͊w̵̨͕͉̻͇̳̤̽͑̆̓̉̉͑̂͒͂̕͘͜͜͝ờ̸̲̤͈̹̰͒͗͂̈́̅͗͘r̸̡̨͈̠̗̟̜̹̞̂̈́͂̎͘͜ͅl̵̨̨̛̝͍̺̠͙̩͚̇̆͛̃͑̊̚͠ḑ̷̨̧̼̤̖̠̜̤̻̦͙̥̱͈̗̅̈́͑̂̒̑͐͘͜"




print("\n\n\n\n\n\n\(zalgo)\n\n\n\n\n\n")
print(zalgo.count)
print(zalgo.unicodeScalars.count)



// 
let yes = true
let no: Bool = false

let int: Int = 16
print(int.isMultiple(of: 8))
let double: Double = 1.1
print(double.isEqual(to: 1.1))
print(double.isLess(than: 0))

let string: String = ""
print(string.isEmpty)
print(string.hasPrefix("h"))
print(string.hasSuffix("!"))
print(string.contains("32"))


let isMale = true
print(isMale ? "Male" : "Female")
