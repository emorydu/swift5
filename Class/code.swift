

import Foundation

class Vehicle {
    var currentSpeed = 0.0
    var description: String {
        return "traveling at \(currentSpeed) miles per hour"
    }

    func makeNoise() {
        // empty
    }
}

let someVehicle = Vehicle()
print("Vehicle: \(someVehicle.description)")

class Bicycle: Vehicle {
    var hasBasket = false
}

let bicycle = Bicycle()
bicycle.hasBasket = true
bicycle.currentSpeed = 15.0
print("Bicycle: \(bicycle.description)")

class Tandem: Bicycle {
    var currentNumberOfPassengers = 0
}

let tandem = Tandem()
tandem.hasBasket = true
tandem.currentNumberOfPassengers = 2
tandem.currentSpeed = 22.0
print("Tandem: \(tandem.description)")

class Train: Vehicle {
    override func makeNoise() {
        print("Choo Choo")
    }
}

let train = Train()
train.makeNoise()

class Car: Vehicle {
    var gear = 1
    override var description: String {
        return super.description + " in gear \(gear)"
    }
}

let car = Car()
car.currentSpeed = 25.0
car.gear = 3
print("Car: \(car.description)")

class AutomaticCar: Car {
    override var currentSpeed: Double {
        didSet {
            gear = Int(currentSpeed / 10.0) + 1
        }
    }
}

let automatic = AutomaticCar()
automatic.currentSpeed = 35.0
print("AutomaticCar: \(automatic.description)")


// init
// struct Fahrenheit {
//     var temperature: Double

//     init() {
//         temperature = 32.0
//     }
// }

// var f = Fahrenheit()
// print("The default temperature is \(f.temperature) Faherenheit.")

struct Fahrenheit {
    var temperature = 32.0
}

var f = Fahrenheit()
print("The default temperature is \(f.temperature).")

// struct Celsius {
//     var temperatureInCelsius: Double
//     init(fromFahrenheit fahrenheit: Double) {
//         temperatureInCelsius = (fahrenheit - 32.0) / 1.8
//     }

//     init(fromKelvin kelvin: Double) {
//         temperatureInCelsius = kelvin - 273.15
//     }
// }

// let boilingPointOfWater = Celsius(fromFahrenheit: 212.0)
// let freezingPointOfWater = Celsius(fromKelvin: 273.15)

// print(boilingPointOfWater)
// print(freezingPointOfWater)

struct Color {
    let red, green, blue: Double 

    init(red: Double , green: Double, blue: Double) {
        self.red = red
        self.green = green
        self.blue = blue
    }

    init(white: Double) {
        red = white
        green = white
        blue = white
    }
}

let magenta = Color(red: 1.0, green: 0.0, blue: 1.0)
let halfGray = Color(white: 0.5)
// let veryGreen = Color(0.0, 1.0, 0.0)    // compile error


// 
struct Celsius {
    var temperatureInCelsius: Double
    init(fromFahrenheit fahrenheit: Double) {
        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
    }
    init(fromKelvin kelvin: Double) {
        temperatureInCelsius = kelvin - 273.15
    }
    init(_ celsius: Double) {
        temperatureInCelsius = celsius
    }
}

let bodyTemperature = Celsius(37.0)
print(bodyTemperature)

// 
// class SurveyQuestion {
//     var text: String
//     var response: String?
//     init(text: String) {
//         self.text = text
//     }
//     func ask() {
//         print(text)
//     }
// }

// let cheeseQuestion = SurveyQuestion(text: "Do you like cheese?")
// cheeseQuestion.ask()
// cheeseQuestion.response = "Yes, I do like cheese"

// 
class SurveyQuestion {
    let text: String
    var response: String?
    init(text: String) {
        self.text = text
    }

    func ask() {
        print(text)
    }
}

let beetsQuestion = SurveyQuestion(text: "How about beets?")
beetsQuestion.ask()
beetsQuestion.response = "I also like beets. (But not with cheese.)"

// Default init
class ShoppingListItem {
    var name: String?
    var quantity = 1
    var purchased = false
}

var item = ShoppingListItem()
print(item)

struct Size {
    var width = 0.0, height = 0.0
}

let twoByTwo = Size(width: 2.0, height: 2.0)
let zeroByTwo = Size(height: 2.0)
print(zeroByTwo.width, zeroByTwo.height)

let zeroByZero = Size()
print(zeroByZero.width, zeroByZero.height)



