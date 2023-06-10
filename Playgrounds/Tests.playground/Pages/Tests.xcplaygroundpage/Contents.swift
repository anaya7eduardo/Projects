import UIKit

func containsDuplicate(_ nums: [Int]) -> Bool {
    let sorted = nums.sorted()
    
    for i in 0 ..< sorted.count-1 {
        if sorted[i] == sorted[i+1] {
            return true
        }
    }
    return false
}

containsDuplicate([1,2,3,1])
containsDuplicate([1,2,1,3,1])
containsDuplicate([1,2,3,5,6])

func isPalindrome(_ s: String) -> Bool {
    let trimmed = s.replacingOccurrences(of: "[^A-Za-z0-9]+", with: "", options: [.regularExpression]).lowercased()
    let reversed = String(trimmed.reversed())
    
    return trimmed == reversed
}

isPalindrome("A man, a plan, a canal: Panama")
isPalindrome(",   ")
isPalindrome("Was it a car?, or a cat I saw?")
isPalindrome("Race a Car")

func searchInsertt(_ nums: [Int], _ target: Int) -> Int {
    var index = 0
    for i in 0 ..< nums.count {
        if nums[i] == target {
            return i
        }
        if target < nums[i]  {
            return i
        }
        index += 1
    }
    return index
}

print("E1", searchInsertt([1,2,4,5],5))
print("E2", searchInsertt([1,2,4,5],1))
print("E3", searchInsertt([1,2,4,5],3))

func searchInsert(_ nums: [Int], _ target: Int) -> Int {
    var low = 0
    var high = nums.count - 1
    while low <= high {
        let mid = low + (high - low) / 2
        if nums[mid] == target {
            return mid
        } else if nums[mid] > target {
            high = mid - 1
        } else {
            low = mid + 1
        }
    }
    
    return low
}

print("E1", searchInsert([1,2,4,5],5))
print("E2", searchInsert([1,2,4,5],1))
print("E3", searchInsert([1,2,4,5],3))

func divide(_ dividend: Int, _ divisor: Int) -> Int {
    if dividend == 0 && divisor == 0 || dividend == 0 || divisor == 0 { return 0 }
    
    if dividend == Int32.min && divisor == -1 { return Int(Int32.max) }
    
    let isNegative = (dividend > 0) == (divisor > 0)
    var dividendAbs = abs(dividend)
    let divisorAbs = abs(divisor)
    var quotient = 0
    
    for i in (0..<32).reversed() {
        if (dividendAbs >> i) >= divisorAbs {
            quotient += (1 << i)
            dividendAbs -= (divisorAbs << i)
        }
    }
    
    return isNegative ? quotient : -quotient
}

print(divide(7, -3))
print(divide(4, 0))
print(divide(0, 4))
print(divide(0, 0))
print(divide(-2147483648, -1))

func intToRoman(_ num: Int) -> String {
    if num >= 1000 {
        return "M" + intToRoman(num - 1000)
    } else if num >= 900 {
        return "CM" + intToRoman(num - 900)
    } else if num >= 500 {
        return "D" + intToRoman(num - 500)
    } else if num >= 400 {
        return "CD" + intToRoman(num - 400)
    } else if num >= 100 {
        return "C" + intToRoman(num - 100)
    } else if num >= 90 {
        return "XC" + intToRoman(num - 90)
    } else if num >= 50 {
        return "L" + intToRoman(num - 50)
    } else if num >= 40 {
        return "XL" + intToRoman(num - 40)
    } else if num >= 10 {
        return "X" + intToRoman(num - 10)
    } else if num >= 9 {
        return "IX" + intToRoman(num - 9)
    } else if num >= 5 {
        return "V" + intToRoman(num - 5)
    } else if num >= 4 {
        return "IV" + intToRoman(num - 4)
    } else if num >= 1 {
        return "I" + intToRoman(num - 1)
    } else {
        return ""
    }
}

//for i in 1...100 {
//    print(intToRoman(i))
//}
print(intToRoman(333))

let n = 0 + 9 + 1 + 3 + 1 + 9 + 9

for number in 1...5 {
    let sum = n+number
    print("09/13/199\(number): \(sum)")
}

for index in 15...100 {
    let aux = index / 2
    print("\(index) : \(aux + 7)")
}

let nameIdentifier = "alberto"
let nameArray: [String] = ["edu", "alb", "rey"]
let assertTrue = "Contains Prefix"

if nameArray.reduce(false, { $0 || nameIdentifier.lowercased().hasPrefix($1) }) {
    print(assertTrue)
}

func methodName(completionBlock: () -> Void) {
    print("block_Completion")
    completionBlock()
}

func methodName2(completionBlock2: () -> ()) {
    print("block_Completion_2")
    completionBlock2()
}

methodName{
    print("Doing something after Block_Completion!!")
}

methodName2 {
    print("Doing something after Block_Completion_2!!")
}

let value: (Int) -> Int = { (value1) in
    return value1
}

print(value(5))

let add: (Int, Int) -> Int = { (value1, value2) in
    return value1 + value2
}

print(add(5, 4))

let addValues: (Int, Int) -> String = { (value1, value2) -> String in
    return String("Sum is: \(value1 + value2)")
}

print(addValues(5, 4))

let boolVal = true

let result = boolVal ? "Positive Number" : "Negative Number"

print(result)

let num = 7

let numResult = (num == 0) ? "Zero" : ((num > 0) ? "Positive" : "Negative")

print("The number is \(numResult).")

let range: Range = 0..<5
let closedRange: ClosedRange = 0...4

print(range.contains(5))
print(closedRange.contains(5))

// Armstrong Number
/*
 153 = (1 x 1 x 1) + (5 x 5 x 5) + (3 x 3 x 3)
 1 + 125 + 27 = 153
 */

func armstrong(_ input: Int) {
    var n = input
    var sum = 0
    while (n > 0) {
        let r = n % 10
        sum += ( r * r * r )
        n /= 10
        print("r: \(r) sum: \(sum) n: \(n)")
    }
    if sum == input {
        print("TRUE: =[ \(input) ]= is an Armstrong Number")
    } else {
        print("FALSE: =[ \(input) ]= is not an Armstrong Number")
    }
}

armstrong(153)
armstrong(8973)
armstrong(407)

//for i in 1...100000 {
//    armstrong(i)
//}
