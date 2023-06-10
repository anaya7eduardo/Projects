import UIKit
import Foundation
import Darwin

//Enumerations
/*
 Enums define a common type for a group of related values and enables you to work with those values in a type-safe way
 in Swift Enums are more flexible and don't have to provide a value for each case of the enumeration
 */

enum CompassPoint {
    case north
    case south
    case east
    case west
}

//Swift enumeration cases don't have an integer value set by default
//In the above CompassPoint example north, south, east, west don't implicity equal 0,1,2,3. Instead, the different enumeration cases are values in their own right with an explicitly defined type of CompassPoint
print(CompassPoint.east)

//iteratin over Enumeration Cases
//it's useful to have a collection of all the enum's cases. You enable this by writing : CaseIterable after the enum's name
enum CompassPoint2: CaseIterable {
    case north
    case south
    case east
    case west
}

for compassPoint in CompassPoint2.allCases {
    print(compassPoint)
}

 //Raw Values
enum Planet: Int, CaseIterable {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus
}

for planet in Planet.allCases {
    print(planet.rawValue)
}

//Init From Raw Value
let newPlanet = Planet(rawValue: 7)
print(newPlanet?.rawValue ?? "Pluto")

//Associated Values in Enumerations
//Enums can store associated values for each case ex:
//We can attach additional information
enum Activity {
    case bored
    case running(destination:String) //We don't know where we're running to
    case talking(topic:String) //What are we talking about
    case singing(volume:Int)
}

let talking = Activity.talking(topic: "Barcelona Football Club")
print(talking)


switch talking {
case .bored:
    print("bored")
case .running(let destination):
    print("running to \(destination)")
case .talking(let topic):
    print("talking about \(topic)")
case .singing(let volume):
    print("singing \(volume)")
}
