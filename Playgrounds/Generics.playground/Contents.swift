import UIKit
import XCTest

func compareTwoNumb<T:Comparable>(_ a: T, _ b: T) {
    if a == b {
        print(" A is equal than B ")
    } else if a < b {
        print(" A is less than B ")
    } else {
        print(" A is greater than B ")
    }
}

compareTwoNumb(16, 8)

let intArray = [2,3,4,5,7,9,10,12,15,21]
let abcArray = ["a", "b", "c", "d", "e", "f", "g"]

func findLetterIndex (_ array:[String], _ letter:String) -> Int? {
    for (index, element) in array.enumerated() {
        if element == letter {
            return index
        }
    }
    return nil
}

findLetterIndex(abcArray, "f")

func linearSearch<T:Comparable> (_ array:[T], _ key:T) -> Int? {
    for (index, element) in array.enumerated() {
        if element == key {
            return index
        }
    }
    return nil
}

linearSearch(intArray, 12)
linearSearch(abcArray, "f")

XCTAssert(linearSearch(abcArray, "f") == 7, "Equal")
