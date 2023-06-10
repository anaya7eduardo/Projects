import UIKit
import Foundation

//Generics

//Generic code enables us to write flexible, reusable functions and types that can work with any type, subject to requirements we define.
//In Swift, generics are one of the most powerful features
//for example Arrays and Dictionaries are generic types

let arrInt = Array<Int>()
let arrString = [String]()

let dict1 = Dictionary<String, Int>()

struct IntStack {
    var items = [Int]()
    mutating func push(_ item:Int) {
        items.append(item)
    }
    mutating func pop() -> Int {
        return items.removeLast()
    }
}

var initStack = IntStack()
initStack.push(2)
initStack.push(6)
print(initStack.pop())

//we can define a generic stack type that can manage a stack of any type of value
// what do we need to create generics? Thy type as in the Int in the example before
//we can represent any type by defining it into a pair of angle <> brackets next to the name

struct Stack<Element> {
    var items = [Element]()
    mutating func push(_ item: Element) {
        items.append(item)
    }
    mutating func pop() -> Element {
        return items.removeLast()
    }
}

var stack1 = Stack<Int>()
stack1.push(3)
var stack2 = Stack<String>()
stack2.push("Guten Tag")

//We can use generics in protocols using associatedtype keyword to define the generic element

protocol StackProtocol {
    associatedtype Element
    var items: [Element] { get set }
    mutating func push(_ item:Element)
    mutating func pop() -> Element
}

//I can use an extension of this protocol to do the implementation
extension StackProtocol {
    mutating func push(_ item:Element) {
        items.append(item)
    }
    mutating func pop() -> Element {
        return items.removeLast()
    }
}

//the above example is POP protocol oriented programming
//this means I can use this protocol for any custom type

struct CustomClass<T>:StackProtocol {
    var items = [T]()
}

var stack3 = CustomClass<Int>()
stack3.push(88)
stack3.pop()
