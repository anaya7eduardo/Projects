///
/// ``Eduardo Reyes``
/// Closures
/// 02/10/23
///

/// Syntax of Closures

// { (parameters) -> returnType in
// statements
// }

/// Non-Escaping Closures
// By default closures are non-escaping.

class ClosureTesting {
    func getUser(completion:(String)->Void){
        completion("John")
    }
    
    func execute() {
        getUser { (user) in
            print(user)
        }
    }
}

let userTest = ClosureTesting()
userTest.execute()

/// Escaping Closures
// Keyword: @escaping, can run at any time during the lifecycle of the app.

var completionHandlers: [() -> Void] = []

func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void) {
    completionHandlers.append(completionHandler)
}

func someFunctionWithNonescapingClosure(closure: () -> Void) {
    closure()
}

class SomeClass {
    var x = 10
    func doSomething() {
        someFunctionWithEscapingClosure { self.x = 100 }
        someFunctionWithNonescapingClosure { x = 200 }
    }
}

let instance = SomeClass()
instance.doSomething()
print(instance.x)
// Prints "200"

completionHandlers.first?()
print(instance.x)
// Prints "100"

/// Trailing Closure
// Passing a closure expression to a function as the function's final argument.

func grabLunch(message: String, search: ()->()) {
    print(message)
    search()
}

grabLunch(message:"Let's go out for lunch")  {
  print("Alfredo's Pizza: 2 miles away")
}

/// Autoclosures
// Keyword: @autoclosure, enables definition of an argument that automatically gets wrapped in a closure

func display(greet: @autoclosure () -> ()) {
    greet()
}

display(greet: print("Hello World!"))
