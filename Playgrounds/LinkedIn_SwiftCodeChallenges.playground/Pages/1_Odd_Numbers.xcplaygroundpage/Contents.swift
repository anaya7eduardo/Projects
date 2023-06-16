import Foundation

// https://www.linkedin.com/learning/swift-code-challenges/print-the-first-n-odd-numbers

let limit = 100
var evenNumbersArray: [Int] = []
var oddNumbersArray: [Int] = []

for index in 1...limit {
    index%2==0 ? evenNumbersArray.append(index) : oddNumbersArray.append(index)
}

print("Even:\n\(evenNumbersArray)")
print("Odd:\n\(oddNumbersArray)")

// Other Solutions:
let n = 10
// Using array filter
print((1...n).filter{ $0 % 2 == 1})

// Using xor
print((1...n).filter{ $0 ^ 1 == $0 - 1 })

// Using stride
let oddNumbers = stride(from: 1, to: n + 1, by: 2)
oddNumbers.forEach{ print($0) }

// Using stride one line
stride(from: 1, through: n + 1, by: 2).forEach{ print($0) }
