///
/// ``Eduardo Reyes``
/// Subscripts / Generics
/// 02/13/23
///

// --- Subscripting an array ---
var letters = ["A", "E", "I", "O", "U"]

let one = letters[1]
print(one)

letters[4] = "W"
print(letters)


// --- Subscripting a dictionary ---
var responseMessages = [200: "OK",
                        403: "Access forbidden",
                        404: "File not found",
                        500: "Internal server error"]

let ok = responseMessages[200]
print(ok!)

responseMessages[301] = "Moved permanently"
print(responseMessages)


// --- Subscript for class ---
class daysofaweek {
    private var days = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
    
    subscript(index: Int) -> String {
        get {
            return days[index]
        }
        
        set(newValue) {
            self.days[index] = newValue
        }
    }
}

var p = daysofaweek()
print(p[0])

p[0] = "Mon"
print(p[0])


// --- Generic Function ---
func displayData<T>(data: T) {
    print("Generic Function:")
    print("Data Passed:", data)
}

displayData(data: 5)

displayData(data: "Swift")


// --- Generic Class ---
class Information<T> {
    var data: T
    init (data: T) {
        self.data = data
    }
    
    func getData() -> T {
        return self.data
    }
}

var intObj = Information<Int>(data: 6)
print("Generic Class returns:", intObj.getData())

var strObj = Information<String>(data: "Swift")
print("Generic Class returns:", strObj.getData())


// --- Type Constraints for Generic function ---
func addition<T: Numeric>(num1: T, num2: T) {
    print("Sum:", num1 + num2)
}

addition(num1: 5, num2: 10)

addition(num1: 5.5, num2: 10.8)


// --- Type Constraints for Generic Class ---
class InformationTwo<T: Numeric> {
    var data: T
    init (data: T) {
        self.data = data
    }
    
    func getData() -> T {
        return self.data
    }
}

var intObjTwo = InformationTwo<Int>(data: 6)
print("Type Constraints for Generic Class returns:", intObj.getData())

var dbleObjTwo = InformationTwo<Double>(data: 6.6)
print("Type Constraints for Generic Class returns:", dbleObjTwo.getData())


// --- Struct Example of Generic ---
struct Stack<Element> {
    var items: [Element] = []
    mutating func push(_ item: Element) {
        items.append(item)
    }
    mutating func pop() -> Element {
        return items.removeLast()
    }
}

var stackOfStrings = Stack<String>()
stackOfStrings.push("uno")
stackOfStrings.push("dos")
stackOfStrings.push("tres")
stackOfStrings.push("cuatro")
print(stackOfStrings)

let fromTheTop = stackOfStrings.pop()
print(stackOfStrings)


// --- Enumerations With Associated Values using Generic ---
enum Location<T> {
    case address(T)
    case coordinate(T, T)
}

let someAddress = Location.address("123 Elm Street")
print(someAddress)

let someCoordinate = Location.coordinate(42.235140, -88.355958)
print(someCoordinate)
