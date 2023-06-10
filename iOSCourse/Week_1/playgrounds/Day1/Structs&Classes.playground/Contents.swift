import UIKit

//has an auto initializer
struct Resolution {
    var width = 0 //defaults
    var height = 0
}

//need to initialize values
class ViewMode {
    var resolution = Resolution()
    var interlaces = false
    var frameRate = 0.0
    var name:String?
}

//create instance of custom values
let someResolution1 = Resolution()
let someVideoMode2 = ViewMode()

//access properties
print(someResolution1.height)
print(someVideoMode2.frameRate)

//here we drill down into subproperties
print(someVideoMode2.resolution.height)

//we can assign new values
someVideoMode2.resolution.height = 20
print(someVideoMode2.resolution.height)

let hd = Resolution(width: 1920, height: 1000)
var film = hd
film.width = 2048

print(hd)
print(film)

//Class
let tenEighty = ViewMode()
tenEighty.resolution = hd
tenEighty.interlaces = true
tenEighty.name = "1009bi"
tenEighty.frameRate = 60

let alsoTenEighty = tenEighty
alsoTenEighty.frameRate = 25

print(tenEighty.frameRate)
print(alsoTenEighty.frameRate)

//Identity Operators
//Classes are reference types. It is possible for multiple constants and cars to refer to the same instance of a class behind the scenes
if tenEighty === alsoTenEighty {
    print("has same reference to the object")
}

//Lazy Stored Properties
//These are properties whose initial value isn't calculated until the first time it's used
//We define it by writing the lazy modifier before its declaration
class Person {
    var name:String
    var lastName:String
    lazy var fullName: String = {
        return "\(name) \(lastName)"
    }()
    init(name:String, lastName:String) {
        self.name = name
        self.lastName = lastName
    }
}

let person = Person(name: "Eduardo", lastName: "Anaya")
print(person.fullName)

//Computed Properties
//These properties don't actually store a value, insted they provide a getter and optional setter
struct Point {
    var x = 0.0, y = 0.0
}

struct Size {
    var width = 0.0, height = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y:centerY)
        }
        set {
            origin.x = newValue.x - (size.width / 2)
            origin.y = newValue.y - (size.height / 2)
        }
    }
}

var rect = Rect()
print(rect.origin.x)
print(rect.center)
rect.center = Point(x: 15.0, y: 15.0)
print(rect.origin.x)
print(rect.center)

//Types Properties
//As we saw each created property corresponds to an instance. This means that if we want to access the property we need to create and instance of said class/struct
//We can create properties that belong to the type itself without needing and instance of a class
//for these properties we use the static keyword. We use the static keyword in structs/classes and enums
struct SomeStruct {
    static let storedTypeProperty = "some value"
    static var computedTypeProperty: Int {
        return 42
    }
}

print(SomeStruct.storedTypeProperty)
print(SomeStruct.computedTypeProperty)

//This is the class keyword to define type properties. We only use class in a class
class SomeClass {
    static var storedTypeProperty = "Some Value"
    static func showFullName()-> String {
        return "Eduardo Anaya"
    }
    class var overridableComputedTypeProperty: Int {
        return 154
    }
}
print(SomeClass.showFullName())
print(SomeClass.storedTypeProperty)
print(SomeClass.overridableComputedTypeProperty)

//Inheritance
class NewClass: SomeClass {
    override class var overridableComputedTypeProperty: Int {
        return 255
    }
}

//if we want to prevent Inheritance we need to add the final keyword
//the mutatin keyword. This keyword is only for structs and given to a method we want to change the state of the struct
struct Point2 {
    var x = 0.0, y = 0.0
    mutating func changePoint(x:Double, y:Double) {
        self.x = x
        self.y = y
    }
}
//remember that the struc is always a copy. So for example with the mutating keyword we would be passing the reference and can change the state
//Here we have an example of how reference and value types can interacts
struct S1 {
    var age:Int = 38
}

class C1 {
    var ageStruct = S1()
}

let c1 = C1()
var s1 = S1(age: 27)
c1.ageStruct = s1
print(c1.ageStruct.age)

/*
 We see the value of the struct which is in the class doesn't change
 because we are using the value types
 this shows us it is always a copy
 */
