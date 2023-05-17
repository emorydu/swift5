# Procotol
## Protocol Syntax
```swift
protocol SomeProtocol {
    // protocol definition goes here
}

struct SomeStructure: FirstProtocol, AnotherProtocol {
    // structure definition goes here
}

class SomeClass: SomeSuperClass, FirstProtocol, AnotherProtocol {
    // class definition goes here
}
```
## Property Requirements
```swift
protocol SomeProtocol {
    var mustBeSettable: Int { get set }
    var doesNotNeedToBeSettable: Int { get }
}

protocol AnotherProtocol {
    static var someTypeProperty: Int { get set }
}
```
## Method Requirements
```swift
protocol SomeProtocol {
    static func someTypeMethod()
}
```
## Mutating Method Requirements
```swift
protocol Togglable {
    mutating func toggle()
}

struct STogglable: Togglable {  // or enum
    mutating func toggle() {
        // implements
    }
}

class CTogglable: Togglable {
    func toggle() {
        // implements
    }
}
```
## Initializer Requirements
```swift
protocol SomeProtocol {
    init(someParameter: Int)
}

class SomeClass: SomeProtocol {
    required init(someParameter: Int) {
        // initializer implementation goes here
    }
}

protocol SomeProtocol {
    init()
}
class SomeSuperClass {
    init() {
        // initializer implementation goes here
    }
}
class SomeSubClass: SomeSuperClass, SomeProtocol {
    // "required" from SomeProtocol conformance; "override" from SomeSuperClass
    required override init() {
        // initializer implementation goes here
    }
}
```
## Protocols as Types
1. As a parameter type or return type in a function, method, or initializer
2. As the type of a constant, variable, or property
3. As the type of items in an array, dictionary, or other container