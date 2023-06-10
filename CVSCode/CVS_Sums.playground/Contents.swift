import UIKit

var greeting = "Hello, playground"

/*
Given an array of numbers and you need to find a pair of numbers which are equal to the given target value. Numbers can be either positive, negative or both.
 
 
inputArray = [2,4,-1,3,0,6]
 
Sum = 5
*/

func twoSum(input: [Int], target: Int) -> [(Int, Int)] {
    
    var result = [(Int, Int)]()
    var dict = [Int: Int]()
    for index in 0..<input.count {
        let value = input[index]
        if let matchIndex = dict[value] {
            
            let number1 = value
            let number2 = input[matchIndex]
            
            result.append((number1, number2))
        }
        
        let minus = target - value
        dict[minus] = index
        
    }
    
    return result
}

let test = [2,4,-1,3,0,6]
let target = 5

let testResult = twoSum(input: test, target: target)
print(testResult)




