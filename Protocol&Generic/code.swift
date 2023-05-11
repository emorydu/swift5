

import Foundation

protocol Combatable: Equatable {    // / Protocol Inherit

    associatedtype Level: Strideable where Level.Stride == Int

    var name: String { get }
    var hp: Int { get set }
    var maxHP: Int { get set }
    var attackPower: Int { get set }
    var level: Level { get set }

    init()

    mutating func modifyLevel()
}

extension Combatable {

    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.name == rhs.name    
    }

    mutating func reset() {
        hp = maxHP
        print("😴😴😴\(name) Sleep well, life value replenished.")
    }

    mutating func upgrade() {
        maxHP = Int(Double(maxHP) * 1.1)
        hp = maxHP
        attackPower = Int(Double(attackPower) * 1.2)
        // level += 1
        level = level.advanced(by: 1)
        // modifyLevel()
        print("✨✨✨\(name) has been upgraded to \(level) and now has life \(hp); attack power \(attackPower).")
    }

    func attack<T: Combatable>(on target: inout T) {
        target.hp -= self.attackPower
        print("👾👾👾\(name) deals \(attackPower) points of damage to \(target.name), \(target.name) is now left with \(target.hp) points of life.")
    }
}

struct Pokemon: Combatable {
    var name: String = "Pokemon"
    var hp: Int = 55
    var maxHP: Int = 55
    var attackPower: Int = 5
    var level: Int = 1
}

struct EvilAliens: Combatable {
    var name: String = "EvilAliens"
    var hp: Int = 66
    var maxHP: Int = 66
    var attackPower: Int = 6
    var level: Int = 1
}

extension Combatable where Level == Int {
    mutating func modifyLevel() {
        level += 1
    }
}

struct Samurai: Combatable {
    enum Classes: Int, Strideable {
        case youngPadwan, apprentice, jediKnight, grandMaster, powerMaster
        typealias Stride = Int

        func advanced(by n: Int) -> Samurai.Classes {
            let level = rawValue + n
            return Classes.init(rawValue: level) ?? .powerMaster
        }

        func distance(to other: Samurai.Classes) -> Int {
            other.rawValue - self.rawValue
        }
        
    }

    var name: String = "Samurai"
    var hp: Int = 77
    var maxHP: Int = 77
    var attackPower: Int = 7
    var level: Classes = .youngPadwan

    mutating func modifyLevel() {
        let level = level.rawValue + 1
        self.level = Classes(rawValue: level) ?? .powerMaster
    }
}


var pikachu: Pokemon = Pokemon(name: "pikachu")
pikachu.upgrade()
var samurai: Samurai = Samurai(name: "samurai")
samurai.upgrade()
samurai.attack(on: &pikachu)