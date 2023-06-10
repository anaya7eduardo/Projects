import UIKit

///
/// Variadic
///
func someFunction(f1 firstParamName: Int, f2 secondParamName: Int = 5) {
    //firstParamName Int
    //secondParamName Int
    print(firstParamName + secondParamName)
}
someFunction(f1: 5, f2: 1)
someFunction(f1: 5)

func greeting(_ person: String, from hometown: String) -> String {
    return "Hello \(person), thanks for visiting us from \(hometown)"
}
greeting("Eddie", from: "ATL")

func mean(_ numbers: Double...) -> Double {
    var total : Double = 0
    for number in numbers {
        total += number
    }
    return total / Double(numbers.count)
}
mean(1,2,3,4,5)
mean(1.5,2.7)
mean(3,4.5,18.75)

//Practice: Geometric mean

func gMean(_ numbers: Double...) -> Double {
    var total : Double = 1
    for number in numbers {
        total *= number
    }
    return pow(total, 1/Double(numbers.count))
}
gMean(1,2,3,4,5)
gMean(2,4,6,8,10)
gMean(1.1,3.3,5.5,7.7,9.9)

///
/// Inout
///
let x = 5

func addOne(number: Int) {
    var number2 = number
    number2 += 1
    print("Number is now \(number2)")
}
addOne(number: x)

func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let tempA = a
    a = b
    b = tempA
}
var someInt = 3
var otherInt = 7
print("someInt is \(someInt), otherInt is \(otherInt)")
swapTwoInts(&someInt, &otherInt)
print("someInt is \(someInt), otherInt is \(otherInt)")

func addOneB(number: inout Int) {
    number += 1
    print("Number is now \(number)")
}
addOne(number: x)

///
/// Types
///
func addTwoInts(_ a: Int, _ b: Int) -> Int {
    return a+b
} //(Int, Int) -> Int

func multiplyTwoInts(_ a: Int, _ b: Int) -> Int {
    return a*b
} //(Int, Int) -> Int

func printHW(){
    print("Hello World")
} //() -> Void

var mathFunction: (Int, Int) -> Int = multiplyTwoInts
mathFunction(4,5)

func printMathResult(_ mathFunc: (Int, Int) -> Int, _ a: Int, _ b: Int) {
    print("Result: \(mathFunction(a,b))")
}

printMathResult(multiplyTwoInts, 5, 9)

func stepForward(_ input: Int) -> Int {
    return input + 1
}

func stepBackward(_ input: Int) -> Int {
    return input - 1
}

stepForward(5)
stepBackward(5)

func chooseStepFunction(backward: Bool) -> (Int) -> Int {
    return backward ? stepBackward : stepForward
}

var value = -7
let moveNearerZero = chooseStepFunction(backward: value > 0)
while value != 0 {
    print("\(value)...")
    value = moveNearerZero(value)
}
print("Zero!")

///
/// Nested
///
func chooseStepFunctionN(backwardN: Bool) -> (Int) -> Int {
    
    func stepForwardN(_ input: Int) -> Int {
        return input + 1
    }

    func stepBackwardN(_ input: Int) -> Int {
        return input - 1
    }
    
    return backwardN ? stepBackwardN : stepForwardN
}
var valueN = 7
let moveNearerZeroN = chooseStepFunctionN(backwardN: valueN > 0)
while valueN != 0 {
    print("\(valueN)...")
    valueN = moveNearerZeroN(valueN)
}
print("Zero!")

///
/// Closures
///
//1. Global functions - Closures with name, do not capture values they work with them
//2. Nested functions - Take/capture values letting us to access/check values from global function
//3. Closures - No name function, written in a light/clean syntax

let names = ["Christian", "Ricardo", "Juan Gabriel", "Edgar", "Freddy"]

//This is a regular function
func backward(_ s1: String, _ s2: String) -> Bool {
    return s1 > s2
}

backward("Juan Gabriel", "Edgar")

var reversedNames = names.sorted(by: backward)

/* Closure Syntax
 { (params) -> return type in
    //Code
 }
 */

/*
 reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in
 return s1>s2
 })
 
 reversedNames = names.sorted(by: { s1, s2 in return s1>s2 })
 
 reversedNames = names.sorted(by: { s1, s2 in s1>s2 })
 
 reversedNames = names.sorted(by: { $0>$1 })
 */

reversedNames = names.sorted(by: >)

///
/// Trailing Closures
///

func someFunctionThatTakesAClosure(closure: () -> Void) {
    //Code
}

someFunctionThatTakesAClosure(closure: {
    //Code
})

someFunctionThatTakesAClosure {
    //Add closure in here
}

reversedNames = names.sorted {$0>$1}

//Map
let digitNames = [0:"Zero", 1:"One", 2:"Two", 3:"Three", 4:"Four", 5:"Five", 6:"Six", 7:"Seven", 8:"Eight", 9:"Nine"]
let numbers = [16, 58, 510, 2127]
let numberStrings = numbers.map { (number) -> String in
    var number = number
    var output = ""
    repeat{
        output = digitNames[number%10]! + output
        number /= 10
    } while number > 0
    return output
}

let numbersWithNegative = [16, -33, 58, 510, -666, 2127]
let numberStringsNegative = numbersWithNegative.map { (numberParam) -> String  in
    var number = numberParam < 0 ? numberParam * -1 : numberParam
    var output = ""
    repeat {
        output = digitNames[number%10]! + output
        number /= 10
    } while(number > 0)
    
    output = numberParam < 0 ? "Minus" + output : output
    return output
}

///
/// Capture Values
///

func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}

let incrementByTen = makeIncrementer(forIncrement: 10)
incrementByTen()
incrementByTen()
incrementByTen()

let incrementBySeven = makeIncrementer(forIncrement: 7)
incrementBySeven()

incrementByTen()

///
/// Escaping  Closures
///

var completionHandlers: [() -> Void] = []

func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void){
    completionHandlers.append(completionHandler)
}
completionHandlers.count

func someFunctionWithNonEscapingClosure(closure: () -> Void){
    closure()
}

class SomeClass{
    var x = 10
    func doSomething(){
        someFunctionWithEscapingClosure {
            self.x = 100
        }
        someFunctionWithNonEscapingClosure {
            x = 200
        }
    }
}

let instance = SomeClass()
print(instance.x)
instance.doSomething()
print(instance.x)

completionHandlers.count
completionHandlers.first?()
print(instance.x)

///
/// Enums
///

enum SomeEnumeration {
    //Enum Definition
}

enum CompassPoint {
    case north
    case south
    case east
    case west
}

enum Planet {
    case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune
}

var directionToGo = CompassPoint.east
directionToGo = .north

switch directionToGo {
case .north:
    print("Go To North")
case .south:
    print("There are penguins in south")
case .east:
    print("Mordor extends to east lands")
case .west:
    print("Watch out with cowboys")
}

let somePlanet = Planet.mars
switch somePlanet {
case .earth:
    print("Earth is safe")
default:
    print("It is not safe going this planet")
}

//Protocols
enum Beverage: CaseIterable {
    case coffe, tea, juice, redbull
}

let numberOfChoices = Beverage.allCases.count
for beverage in Beverage.allCases{
    print(beverage)
}

//Barcodes
enum Barcode {
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}

var productBarcode = Barcode.upc(8, 85909, 51226, 3)
productBarcode = .qrCode("ASDFGHJKL")

switch productBarcode {
case let .upc(numberSystem, manufacturer, product, check):
    print("UPC: \(numberSystem), \(manufacturer), \(product), \(check)")
case let .qrCode(productCode):
    print("QR: \(productCode)")
}

//Raw Values
enum ASCIIControlCharacter: Character{
    case tab = "\t"
    case lineFeed = "\n"
    case carriageReturn = "\r"
}

enum CompassPoint2: String {
    case north
    case south
    case east
    case west
}

enum Planet2: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
}

let earthOrder = Planet2.earth.rawValue
let northDirection = CompassPoint2.north.rawValue
let possiblePlanet = Planet2(rawValue: 5)

let planetPosition = 3
if let anyPlanet = Planet2(rawValue: planetPosition){
    switch anyPlanet {
    case .earth:
        print("Earth is safe")
    default:
        print("It is not safe going this planet")
    }
} else {
    print("Choosen planet do not exists")
    }
