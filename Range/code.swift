
import Foundation


// Range
let range = 3..<6

print(range.isEmpty)
print(range.count)
print(range.first!)
print(range.last!)
print(range.lowerBound)
print(range.upperBound)

// ClosedRange
let closedRange = 3...6
print(closedRange.isEmpty)
print(closedRange.count)
print(closedRange.first!)
print(closedRange.last!)
print(closedRange.lowerBound)
print(closedRange.upperBound)

// PartialRangeFrom
let r1 = 3...
let r2 = ...3
let r3 = ..<3

let stringRange = "a"..."z"