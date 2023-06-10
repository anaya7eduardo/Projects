import UIKit

//Control Flow
var scores: [Float16] = [Float16]()
scores = [0.5,0.7,0.2,0.3]
var highs = [Float16]()
var average: Float16 = 0.0

for score in scores {
    if score >= 0.0899 {
        highs.append(score)
    }
    average += score
}

print(highs)
average = average / Float16(scores.count)
print(average)

//Reset Values
highs = []
average = 0.0

for i in 0..<scores.count {
    let score = scores[i]
    if score >= 0.0899 {
        highs.append(score)
    }
    average += score
}

print(highs)
average = average / Float16(scores.count)
print(average)
                            
//Reset Values
highs = []
for score in scores where score >= 0.0899 {
    highs.append(score)
}
print(highs)

//From Apple
let vegetable = "red pepper"
switch vegetable {
case "celery":
    print("Add some raisins and make ants on a log.")
case "cucumber, watercress":
    print("that would make a good tea sandwich.")
case let x where x.hasSuffix("pepper"):
    print("Is it a spicy \(x)?")
default:
    print("Everything tastes good in a soup")
}

//Other Switch Example
let approxCount = 62
let countedThings = "moons orbiting Saturn"
let naturalCount:String
switch approxCount {
case 0:
    naturalCount = "no"
case 1..<5:
    naturalCount = "a few"
case 5..<12:
    naturalCount = "several"
case 12..<100:
    naturalCount = "dozens of"
case 100..<1000:
    naturalCount = "hundreds of"
default:
    naturalCount = "many"
}

print("There are \(naturalCount) \(countedThings).")

let interestingNumbers = [
    "Prime": [2,3,5,7,11,13],
    "Fibs": [1,1,2,3,5,8],
    "Square": [1,4,9,16,25]
]

var largest = 0
for (_, numbers) in interestingNumbers {
    for number in numbers {
        if number > largest {
            largest = number
        }
    }
}
print(largest)

//While
var n = 2
while n < 100 {
    n += 2
}
print(n)

var m = 2
repeat {
    m += 2
} while m < 100
print(m)
