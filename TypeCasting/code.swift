

import Foundation

let number: Any = 1
let string: Any = "hello, world"
let type: Any = Int.self
let array = [number, string, type]

class A {}
class B {}

let a = A()
let b = B()

let classArray: [Any] = [a, b]
// let classArray2: [AnyObject] = [a, b, number]   // number not AnyObject, compile error
let classArray2: [Any] = [a, b]


let arrayAny: [Any] = [3, "hello"]
print(arrayAny is [Int])    // false
print(arrayAny is [CustomStringConvertible])    // true

print(arrayAny as? [Int])   // nil
print(arrayAny as? [CustomStringConvertible])   // Optional([3, "hello"])


// print(arrayAny as! [Int])   // runtime error
let descriptions =  arrayAny as! [CustomStringConvertible]

descriptions.forEach { element in 
    if element is Int {
        print("Int: \(element)")
    } else if element is String {
        print("String: \(element)")
    }
}

descriptions.forEach { element in 
    if let element = element as? Int {
        print("Int: \(element)")
    } else if let element = element as? String {
        print("String: \(element)")
    }
}

descriptions.forEach { element in 
    switch element {
    case is String:
        print("String: \(element)")
    case let element as Int:
        print("Int: \(element)")
    default: 
        break
    }
}



// office example
class MediaItem {
    var name: String
    init(name: String) {
        self.name = name
    }
}

class Movie: MediaItem {
    var director: String 
    init(name: String, director: String) {
        self.director = director
        super.init(name: name)
    }
}

class Song: MediaItem {
    var artist: String
    init(name: String, artist: String) {
        self.artist = artist
        super.init(name: name)
    }
}

let library = [
    Movie(name: "Casablanca", director: "Michael Curtiz"),
    Song(name: "Blue Suede Shoes", artist: "Elvis Presley"),
    Movie(name: "Citizen Kane", director: "Orson Welles"),
    Song(name: "The One And Only", artist: "Chesney Hawkes"),
    Song(name: "Never Gonna Give You Up", artist: "Rick Astley")
]

var movieCount = 0
var songCount = 0
library.forEach { item in 
    if item is Movie {
        movieCount += 1
    } else if item is Song {
        songCount += 1
    }
}

print("Media library contains \(movieCount) movies and \(songCount) songs.")


library.forEach { item in 
    if let movie = item as? Movie {
        print("Movie: \(movie.name), dir. \(movie.director)")
    } else if let song = item as? Song {
        print("Song: \(song.name), by \(song.artist)")
    }
}

var things: [Any] = []
things.append(0)
things.append(0.0)
things.append(42)
things.append(3.14159)
things.append("hello")
things.append((3.0, 5.0))
things.append(Movie(name: "Ghostbusters", director: "Ivan Reitman"))
things.append({ (name: String) -> String in "Hello, \(name)" })

for thing in things { 
    switch thing {
    case 0 as Int:
        print("zero as an Int")
    case 0 as Double:
        print("zero as a Double")
    case let someInt as Int:
        print("an integer value of \(someInt)")
    case let someDouble as Double:
        print("a positive double value of \(someDouble)")
    case is Double:
        print("some other double value that I don't want to print")
    case let someString as String:
        print("a string value of \"\(someString)\"")
    case let (x, y) as (Double, Double):
        print("an (x, y) point at \(x), \(y)")
    case let movie as Movie:
        print("a movie called \(movie.name), dir. \(movie.director)")
    case let stringConverter as (String) -> String:
        print(stringConverter("Michael"))
    default:    
        print("something else")
    }
}

let optionalNumber: Int? = 3
things.append(optionalNumber)
things.append(optionalNumber as Any)

