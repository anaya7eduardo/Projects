protocol Human {
    func getName(firstName: String, middleName: String?, lastName: String)
    func sayHi()
    func sleep()
    
    var firstName: String { get set }
    var middleName: String? { get set }
    var lastName: String { get set }
}

class Person: Human {
    var firstName: String = ""
    var middleName: String?
    var lastName: String = ""
    
    func getName(firstName: String, middleName: String?, lastName: String) {
        print(firstName, middleName ?? "", lastName)
    }
    
    func sayHi() {
        print("Hi there!")
    }
    
}

let name1 = Person()
name1.sayHi()
name1.getName(firstName: "Eduardo", middleName: nil, lastName: "Reyes")

extension Human {
    func sleep() {
        print("Human is Sleeping")
    }
}

let state = Person()
state.sleep()
