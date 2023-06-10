import UIKit

var num1 : Int = 7234
var finishPlay = Int()

repeat {
    let num1S = String(num1)
    let num1SR = String(num1S.reversed())
    let num2 : Int? = Int(num1SR)
    print("\(num1) + \(num2!)")
    
    num1 += num2!
    
    let str = String(num1)
    let middle = str.count % 2
    var middleN = 0

    if (middle == 0) {
        middleN = (str.count/2)
    } else {
        middleN = (str.count/2)+1
    }

    let startLeft = str.index(str.startIndex, offsetBy: 0)
    let endLeft = str.index(str.endIndex, offsetBy: -middleN)
    let rangeLeft = startLeft..<endLeft
    let mySubstringLeft = str[rangeLeft] //01234

    let startRight = str.index(str.startIndex, offsetBy: middleN)
    let endRight = str.index(str.endIndex, offsetBy: 0)
    let rangeRight = startRight..<endRight
    let mySubstringRight = str[rangeRight] //43210

    //print("Left: \(mySubstringLeft)")
    //print("Right: \(mySubstringRight)")

    let mySubstringRightReversed = String(mySubstringRight.reversed())

    if (mySubstringLeft == mySubstringRightReversed){
        print("Palindrome: \(str)")
        finishPlay = 1
    }
    
} while finishPlay != 1
