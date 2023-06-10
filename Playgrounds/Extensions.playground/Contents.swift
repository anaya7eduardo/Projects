///
/// ``Eduardo Reyes``
/// Swift: Extensions
/// 02/08/2023
///

/// Default syntax and usage

class SomeType {
    // code goes here
}

extension SomeType {
    // new functionality to add to SomeType goes here
}

/// Computed properties inside Extensions

extension Double {
    var pound: Double { return self * 2.20462 }
    var kilo: Double { return self * 0.45359 }
}

let kgToLb = 1.pound
print("One kilo is \(kgToLb) pound(s)")
// Prints "One kilo is 2.20462 pound(s)"
let lbToKg = 1.kilo
print("One pound is \(lbToKg) kilo(s)")
// Prints "One pound is 0.45359 kilo(s)"

/// Use of Extensions for Adding new functionality to class and struct

class Geometry {
    var radius: Double = 0
    var base: Double = 0
    var height: Double = 0
}

extension Geometry {
    var cirArea: Double { return 3.14 * radius * radius }
}

let circle = Geometry()
circle.radius = 5
print("Area:", circle.cirArea)
// Prints "Area: 78.5"

extension Geometry {
    func triArea() -> Double {
        let triArea = ( base * height ) / 2
        return triArea
    }
}

let triangle = Geometry()
triangle.base = 3
triangle.height = 6
print("Area:", triangle.triArea())
// Prints "Area: 9.0"

/// Use of Extensions for Adding new functionality to Any System data Type(Int, String any one )

extension RandomAccessCollection {
    func element(at index: Index) -> Element? {
        guard indices.contains(index) else {
            return nil
        }

        return self[index]
    }
}

var array = [2, 1, 4, 3, 7, 5, 6]

let fifthElement = array.element(at: 4)

print("5th Element: \(fifthElement!)")
//Prints "5th Element: 7"

/// Use of Extensions for Code segregation

struct Human {
    let firstName: String
    let lastName: String
}

extension Human {
    // An extension is created for the behavior of the type,
    // that is, methods and computed properties
}

private extension Human {
    // private behavior
}

/// Protocol Extension

protocol Person {
    var name: String { get }
    func sayHello()
}

extension Person {
    func sayHello() {
        print("Hi, I'm \(name)")
    }
}

struct Employee: Person {
    let name: String
}

let person1 = Employee(name: "Eduardo Reyes")
person1.sayHello()
// Prints "Hi, I'm Eduardo Reyes"

/// Use of Constants inside Extension

extension String {
    static let test = "This is a Test"
    static var test2 = "This is a Test2"
}

print("Test: \(String.test)")
// Prints "Test: This is a Test"
print("Test2: \(String.test2)")
// Prints "Test2: This is a Test2"
