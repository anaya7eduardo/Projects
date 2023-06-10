import UIKit
import Foundation

//Functions & Closures
func greet(person:String, day:String)-> String{
    return "Hello \(person), today is \(day)."
}
greet(person: "John", day: "Wednesday")

func geet(_ person:String, on day:String)-> String {
    return "Hello \(person), today is \(day)."
}
greet(person: "Mauro", day: "Thursday")

//Tuple
//Use tuples to make compund values ex: return multiple values from a func
let tuple1 = (404, "Not Found")
//http status code
let tuple2 = (code: 404, message: "Not Found")
print(tuple2.code)

func calculateStatistics(scores: [Int]) -> (min: Int, max: Int, sum: Int) {
    var min = scores[0]
    var max = scores[0]
    var sum = 0
    
    for score in scores {
        if score > max {
            max = score
        } else if score < min {
            min = score
        }
        sum += score
    }
    return (min, max, sum)
}
let statistics = calculateStatistics(scores: [5,3,100,8,9])
print(statistics.sum)

//Closures
/*
 Closures are anonymous funcs --no name
 Can be a type of storage for values. Can save vars/lets
 
 Closures are a function and reference type
 @escaping annotation: since closures are ref types we use @escaping to execute closure outside the method
 */

func fetchFromAPI(with url:String, completion:@escaping (Int)-> Void) {
    //fetch
    //get JSON
    //map to the model
    completion(200)
}

fetchFromAPI(with: "https://enhanceit.com") { code in
    print(code)
}

//When we use an array we can also can have closures
let names = ["Chris", "Eli", "Anaya", "Daniella"]

let nameSorted1 = names.sorted {name1, name2 in
    return name1 < name2
}
print(nameSorted1)

let nameSorted2 = names.sorted(by: {return $0 < $1})
print(nameSorted2)

let nameSorted3 = names.sorted { $0 < $1 }
print(nameSorted3)
