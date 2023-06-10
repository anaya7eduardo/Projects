import UIKit

//Protocols

// creating a protocol
protocol BinaryRepresentable {
    //define properties
    var tag:String { get set }
    var data:Data { get }
    
    //we can also use the static keyword
    static var counter:Int { get }
    static func incrementedCounter()
    
    //define func
    mutating func update(data:Data)-> Bool
    //remember that we need to add the keyword mutating for structs because we want to change the state of the object itself
}

//using protocols
//Swift is also POP protocol oriented programming

struct TaggedDataS: BinaryRepresentable {
    var tag: String
    var data: Data
    
    static var counter: Int = 0
    static func incrementedCounter() {
        counter += 1
    }
    
    mutating func update(data: Data) -> Bool {
        self.data = data
        return true
    }
}

class TaggedDataC: BinaryRepresentable {
    var tag: String
    var data: Data
    
    init(tag:String, data:Data) {
        self.tag = tag
        self.data = data
    }
    
    static var counter: Int = 0
    static func incrementedCounter() {
        counter += 1
    }
    
    func update(data: Data) -> Bool {
        self.data = data
        return true
    }

}

// remember that protocols are a type so we can use it in arrays for example
var binaries = [BinaryRepresentable]()
let b1 = TaggedDataS(tag: "", data: Data(base64Encoded: "Welcome to EnhanceIT")!)
let b2 = TaggedDataC(tag: "", data: Data(base64Encoded: "Week 1, day 2")!)

binaries.append(b1)
binaries.append(b2)
