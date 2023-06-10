import UIKit

//simple values
//var greeting = "Hello, playground"
let firstName = "Eduardo"
let lastName = "Anaya"
let myAge = 29

//hello world!
var greeting: String = "hello world!"
print(greeting)

//string Interpolation
let fullName = firstName + " " + lastName
print(fullName)

let completeName2 = "My name is \(firstName) \(lastName) of the loyal house Targaryan, I was born \(myAge) years ago."
print(completeName2)

let constant2: String
constant2 = "test"

/*
 Simple Values Are
 Int
 Double
 Strings
 */

//Optionals
let example: String?
let age = "37"
let convertedValue = Int(age)
print (convertedValue)
print (convertedValue!)

//Optional Binding
if let newAge = convertedValue {
    var year = 2021 - newAge
    greeting.append("Hello World!")
}

func generateGreeting(to value:String?)-> String? {
    var greeting = value
    greeting?.append("Hey How Are You Today?")
    return greeting
}

var optionalValue: String?
print(generateGreeting(to: optionalValue))


//Double
let double1 :Double = 12.5   //Double = Float64
let double2 = 1_000.5
print(double2)

let double3: Float16 = 5.0

let implicitInt = 36
let explicitDouble: Double = 36

//guard let
//force unwrapping. --when you use ! bang or exclamation
//nil-coalescing -using ?? to validate an optional or provide a default value
var num: Int?
num = 40
print(num ?? 28)

/*
 Swift Reference
 
 docs.swift.org/
 */

//Collection Types
//Arrays
//Dictionaries
//Sets
let ages = [18,26,57,101]

let ages2: [Int]
ages2 = [21,98,53,37]

let ages3 = [Int]()

let ages4: [Int] = []

let ages5 = Array<Int>()

print(ages2)

let set1 = Set(ages2)
print(set1)

//Dictionary
var dictionary1 = Dictionary<String, String>()
var dictionary2: [String:String] = [:]
let dictionary3 = [String: String]()
dictionary1["name"] = "Eduardo"
print(dictionary1["name"] ?? "")

//Access Element In Collection
print(ages2[2])
print(Array(set1)[0])
